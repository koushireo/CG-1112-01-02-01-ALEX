#include <conio.h>
#include <iostream>
using namespace std;

int main(){
    char key = ' ';

    while(key != 'q'){
	key = _getch();
	cout << (key == 'w');
    }
	
    return 0;
}