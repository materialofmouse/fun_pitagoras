import de.looksgood.ani.*;
import processing.serial.*;

Serial serialPort;
boolean firstContact = false;
byte[] inByte = new byte[3];


test a = new test(500,500,50,50,"ellipse");
float ballX = 2000;
float ballY = -50;
color ballC = color(120);
float ballX2 = 1945;
float ballY2 = 240;
float eff1 = 0;
float eff2 = 0;
float eff3 = 0;
float eff4 = 0;
float eff5_1 = 0;
float eff5_2 = 1920;
float eff6 = 0;
float eff7 = 1105;
float eff8 = 0;
float ballX3 = 960;
float ballY3 = 1120;
float ballX4 = 300;
float ballY4 = 1120;
float landR = 1920;
float landL = -920*2;
float switch_height = 20;
int effCnt = 0;
boolean ballVisible = true;

void setup(){
	//fullScreen();
	//arduino
	String portName = Serial.list()[0];
	serialPort = new Serial(this, portName, 9600);
	serialport.buffer(inByte.length);

	//animation
	size(1920,1080);
  smooth();
	noStroke();
  frameRate(120);
	Ani.init(this);
  AniSequence seq = new AniSequence(this);
	seq.beginSequence();
  seq.beginStep();
  seq.add(Ani.to(this, 1, "eff1", 5000));
  seq.endStep();
  seq.beginStep();
  seq.add(Ani.to(this, 1, "eff2", 5000));
  seq.endStep();
  seq.beginStep();
  seq.add(Ani.to(this, 2, "eff3", 5000));
  seq.endStep();
  seq.beginStep();
  seq.add(Ani.to(this, 1, "landR", 1920-920));
  seq.add(Ani.to(this, 2, "landL", 0)); 
  seq.add(Ani.to(this, 4, "ballX" , 1920-928, Ani.CUBIC_OUT));
  seq.add(Ani.to(this, 2, "ballY" , 975, Ani.BOUNCE_OUT));
  seq.endStep();
  seq.beginStep();
  seq.add(Ani.to(this, 2, "ballX", 1920-965, Ani.SINE_IN));
  seq.add(Ani.to(this, 2.5, "ballY", 1120, Ani.EXPO_IN));
  seq.endStep();
  seq.add(Ani.to(this, 1, "eff4", 6000, Ani.CUBIC_IN));
  seq.beginStep();
  seq.add(Ani.to(this, 1, "eff5_1",600));
  seq.add(Ani.to(this, 1, "eff5_2", -1500 * 1.41));
  seq.endStep();
	seq.beginStep();
	seq.add(Ani.to(this, 4, "ballX2", 0, Ani.LINEAR));
	seq.add(Ani.to(this, 4, "ballY2", 1360, Ani.LINEAR));
	seq.endStep();
	seq.add(Ani.to(this, 1, "eff6", 5000));
	seq.beginStep();
	seq.add(Ani.to(this, 1.5, "eff7", 300));
	seq.add(Ani.to(this, 1.5, "ballY3", 275));
	seq.add(Ani.to(this, 1.5, "ballY4", 275));
	seq.endStep();
	seq.add(Ani.to(this, 2, "eff8", 20));
	seq.endSequence();
	seq.start();
}
void draw(){
  background(250);
  fill(200);
  ellipse(0,0,eff1,eff1);
  fill(60);
  ellipse(1920,0,eff2,eff2);
  fill(250);
  ellipse(980, 0, eff3, eff3);
 if(ballVisible){
    fill(ballC);
    ellipse(ballX,ballY,50,50);
  }
  //land
  fill(20);
  rect(landL, 1000, 920, 80);
  rect(landR, 1000, 920, 80);
  //next 
  fill(130);
  ellipse(1920/2,1920,eff4,eff4);
  fill(250);
	pushMatrix();
  rotate(PI/3);
  rect(eff5_1,eff5_2,600,3000);
	rotate(0);
	popMatrix();
	fill(0);
	ellipse(ballX2,ballY2,50,50);
	ellipse(100, 1120, eff6, eff6);
	fill(250);
	pushMatrix();
	rotate(radians(eff8));
	rect(0,eff7, 2500, 1080);
	popMatrix();
	fill(120);
	ellipse(ballX3,ballY3,50,50);
	ellipse(ballX4,ballY4,50,50);
}

void serialEvent(Serial port) {
  inByte = port.readBytes();

  if(firstContact == false) {
    if(inByte[0] == 'C') { // Arduinoとの接続確認
      port.clear();
      firstContact = true;
      sendServo(1, 70);
    } 
  }
}

// シリアルポートにサーボの値を送るメソッド
void sendServo(int id, int value)
{
  if(!firstContact) return;
  int v = value;
  serialPort.write((byte)'S');
  serialPort.write((byte)id);
  serialPort.write((byte)v);
}

void servo1(){
	serialPort.write((byte)'S');
	serialPort.write((byte)1);
	serialPort.write((byte)130);
}
