#include <Servo.h>
 
char inBytes[3];

int servoPin1 = 9;
Servo servo1;
int servoPin2 = 10;
Servo servo2;
 
  void setup() {
  pinMode(13, OUTPUT);     
  digitalWrite(13, LOW);
  
  servo1.attach(servoPin1);
  servo2.attach(servoPin2);
  
  Serial.begin(9600); // opens serial port, sets data rate to 9600 bps
  establishContact();  // send a byte to establish contact until receiver responds 
}

void loop() {
  // when you receive data:
  if (Serial.available() > 0) {
    // read the incoming byte:
      Serial.readBytes(inBytes, 3); 
    
    if(inBytes[0]=='S'){
      if((inBytes[2] >= 0)&&(inBytes[2] <= 180)){
        if(inBytes[1] == 1)servo1.write(inBytes[2]);
        if(inBytes[1] == 2)servo2.write(inBytes[2]);
      }
    }
  }
}

void establishContact() {
  while (Serial.available() <= 0) {
    Serial.print('C');
    delay(300);
  }
}
