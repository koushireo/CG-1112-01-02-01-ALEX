#define LED 13 // Use the onboard Uno LED
#define isObstaclePin 2 // This is our input pin
void foo() {
  Serial.println("OBSTACLE!!, OBSTACLE!!");
  digitalWrite(LED, HIGH);
}

void setup() {
pinMode(LED, OUTPUT);
pinMode(isObstaclePin, INPUT);
attachInterrupt(digitalPinToInterrupt(isObstaclePin), foo, LOW);
Serial.begin(9600);
}



void loop() {
Serial.println("clear");
digitalWrite(LED, LOW);
}
