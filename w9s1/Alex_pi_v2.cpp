#include <iostream>
#include <pthread.h>
#include <semaphore.h>
#include <unistd.h>
#include <stdint.h>
#include "packet.h"
#include "serial.h"
#include "serialize.h"
#include "constants.h"

#define PORT_NAME			"/dev/ttyACM0"
#define BAUD_RATE			B57600

using namespace std;

int exitFlag=0;
sem_t _xmitSema;

TCommandType lastCommand = COMMAND_STOP;
bool serialReady = true;

void handleError(TResult error)
{
	switch(error)
	{
		case PACKET_BAD:
			cout << "ERROR: Bad Magic Number\n";
			break;

		case PACKET_CHECKSUM_BAD:
			cout << "ERROR: Bad checksum\n";
			break;

		default:
			cout << "ERROR: UNKNOWN ERROR\n";
	}
}

void handleStatus(TPacket *packet)
{
	cout << "\n ------- ALEX STATUS REPORT ------- \n\n";
	cout << "Left Forward Ticks:\t\t" << packet->params[0] << "\n";
	cout << "Right Forward Ticks:\t\t" << packet->params[1] << "\n";
	cout << "Left Reverse Ticks:\t\t" << packet->params[2] << "\n";
	cout << "Right Reverse Ticks:\t\t" << packet->params[3] << "\n";
	cout << "Left Forward Ticks Turns:\t" << packet->params[4] << "\n";
	cout << "Right Forward Ticks Turns:\t" << packet->params[5] << "\n";
	cout << "Left Reverse Ticks Turns:\t" << packet->params[6] << "\n";
	cout << "Right Reverse Ticks Turns:\t" << packet->params[7] << "\n";
	cout << "Forward Distance:\t\t" << packet->params[8] << "\n";
	cout << "Reverse Distance:\t\t" << packet->params[9] << "\n";
	cout << "\n---------------------------------------\n\n";
}

void handleResponse(TPacket *packet)
{
	// The response code is stored in command
	switch(packet->command)
	{
		case RESP_OK:
			cout << "Command OK\n";
		break;

		case RESP_LEFT:
		        cout << "Obstacles on the left!!";
		break;

		case RESP_FRONT:
		        cout << "Obstacles in front!!";
		break;

		case RESP_RIGHT:
		        cout << "Obstacles on the right!!";
		break;

		case RED:
		        cout << "RED" ;
		break;

		case GREEN:
		        cout << "GREEN" ;
		break;

		case DUNNO:
		        cout << "COLOR ERROR";
		break;

		case RESP_STATUS:
			handleStatus(packet);
		break;

		default:
			cout << "Alex is confused.\n";
	}
}

void handleErrorResponse(TPacket *packet)
{
	// The error code is returned in command
	switch(packet->command)
	{
		case RESP_BAD_PACKET:
			cout << "Arduino received bad magic number\n";
		break;

		case RESP_BAD_CHECKSUM:
			cout << "Arduino received bad checksum\n";
		break;

		case RESP_BAD_COMMAND:
			cout << "Arduino received bad command\n";
		break;

		case RESP_BAD_RESPONSE:
			cout << "Arduino received unexpected response\n";
		break;

		default:
			cout << "Arduino reports a weird error\n";
	}
}

void handleMessage(TPacket *packet)
{
	cout << "Message from Alex: " << packet->data << "\n";
}

void handlePacket(TPacket *packet)
{
	switch(packet->packetType)
	{
		case PACKET_TYPE_COMMAND:
				// Only we send command packets, so ignore
			break;

		case PACKET_TYPE_RESPONSE:
				handleResponse(packet);
			break;

		case PACKET_TYPE_ERROR:
				handleErrorResponse(packet);
			break;

		case PACKET_TYPE_MESSAGE:
				handleMessage(packet);
			break;
	}
}

void sendPacket(TPacket *packet)
{
	char buffer[PACKET_SIZE];
	int len = serialize(buffer, packet, sizeof(TPacket));

	serialWrite(buffer, len);
}

void *receiveThread(void *p)
{
	char buffer[PACKET_SIZE];
	int len;
	TPacket packet;
	TResult result;
	int counter=0;

	while(1)
	{
		len = serialRead(buffer);
		counter+=len;
		if(len > 0)
		{
			result = deserialize(buffer, len, &packet);

			if(result == PACKET_OK)
			{
				counter=0;
				handlePacket(&packet);
				serialReady = true;
			}
			else 
				if(result != PACKET_INCOMPLETE)
				{
					cout << "PACKET ERROR\n";
					handleError(result);
				}
		}
	}
}

void flushInput()
{
	char c;

	while((c = getchar()) != '\n' && c != EOF);
}

void getParams(TPacket *commandPacket)
{
    commandPacket->params[0] = 0; commandPacket->params[1] = 100;
    //flushInput();
    return;

    //redundant part from older version
	cout << "Enter distance/angle in cm/degrees (e.g. 50) and power in %% (e.g. 75) separated by space.\n";
	cout << "E.g. 50 75 means go at 50 cm at 75%% power for forward/backward, or 50 degrees left or right turn at 75%%  power\n";
	cin >> commandPacket->params[0] >> commandPacket->params[1];
	flushInput();
}

void sendCommand(char command)
{
	TPacket commandPacket;

	commandPacket.packetType = PACKET_TYPE_COMMAND;
	if(!serialReady){
		cout << "Serial Waiting for Response. Please Wait...\n";
		return;
	}

	switch(command)
	{
		case 'w':
		case 'W':
			if(lastCommand == COMMAND_FORWARD) break;
			lastCommand = COMMAND_FORWARD;
			getParams(&commandPacket);
			commandPacket.command = COMMAND_FORWARD;
			sendPacket(&commandPacket);
			serialReady = false;
			break;

		case 's':
		case 'S':
			if(lastCommand == COMMAND_REVERSE) break;
			lastCommand = COMMAND_REVERSE;
			getParams(&commandPacket);
			commandPacket.command = COMMAND_REVERSE;
			sendPacket(&commandPacket);
			serialReady = false;
			break;

		case 'a':
		case 'A':
			if(lastCommand == COMMAND_TURN_LEFT) break;
			lastCommand = COMMAND_TURN_LEFT;
			getParams(&commandPacket);
			commandPacket.command = COMMAND_TURN_LEFT;
			sendPacket(&commandPacket);
			serialReady = false;
			break;

		case 'd':
		case 'D':
			if(lastCommand == COMMAND_TURN_RIGHT) break;
			lastCommand = COMMAND_TURN_RIGHT;
			getParams(&commandPacket);
			commandPacket.command = COMMAND_TURN_RIGHT;
			sendPacket(&commandPacket);
			serialReady = false;
			break;

		case 'x':
		case 'X':
			if(lastCommand == COMMAND_STOP) break;
			lastCommand = COMMAND_STOP;
			commandPacket.command = COMMAND_STOP;
			sendPacket(&commandPacket);
			serialReady = false;
			break;
		
		case 'c':
		case 'C':
			if(lastCommand == COMMAND_COLORS) break;
			lastCommand = COMMAND_COLORS;
			commandPacket.command = COMMAND_COLORS;
			sendPacket(&commandPacket);
			serialReady = false;
			break;

		case 'z':
		case 'Z':
			if(lastCommand == COMMAND_CLEAR_STATS) break;
			lastCommand = COMMAND_CLEAR_STATS;
			commandPacket.command = COMMAND_CLEAR_STATS;
			commandPacket.params[0] = 0;
			sendPacket(&commandPacket);
			serialReady = false;
			break;

		case 'g':
		case 'G':
			if(lastCommand == COMMAND_GET_STATS) break;
			lastCommand = COMMAND_GET_STATS;
			commandPacket.command = COMMAND_GET_STATS;
			sendPacket(&commandPacket);
			serialReady = false;
			break;

		case 'q':
		case 'Q':
			exitFlag=1;
			break;

		default:
			cout << "Bad command\n";

	}
}

int main()
{
	// Connect to the Arduino
	startSerial(PORT_NAME, BAUD_RATE, 8, 'N', 1, 5);

	// Sleep for two seconds
	cout << "WAITING TWO SECONDS FOR ARDUINO TO REBOOT\n";
	sleep(2);
	cout << "DONE\n";

	// Spawn receiver thread
	pthread_t recv;

	pthread_create(&recv, NULL, receiveThread, NULL);

	// Send a hello packet
	TPacket helloPacket;

	helloPacket.packetType = PACKET_TYPE_HELLO;
	sendPacket(&helloPacket);

	char ch = ' ';
	while(cin >> ch, ch != 'q')
	{		
		//printf("Command (f=forward, b=reverse, l=turn left, r=turn right, s=stop, c=clear stats, g=get stats q=exit)\n");
		//ch = _getch();

		// Purge extraneous characters from input stream
		//flushInput();
		cout << "command received: " << ch << "\n";
		sendCommand(ch);
	}

	cout << "Closing connection to Arduino.\n";
	endSerial();
}
