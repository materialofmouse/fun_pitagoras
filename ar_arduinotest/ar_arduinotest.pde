import processing.serial.*;

Serial serialPort; // Arduinoにデータを送るシリアルポート
boolean firstContact = false;  //Arduinoからのはじめの送信を確認する

byte[] inByte = new byte[3]; // 受信データ用バッファ

int oval1;
boolean id = true;

void setup() {
  size(200, 200);
  
  printArray(Serial.list()); // 使用可能なシリアルポート一覧の出力。デバッグ用
  String portName = Serial.list()[0]; // 使用するシリアルポート名
  serialPort = new Serial(this, portName, 9600);
  serialPort.buffer(inByte.length); // 読み込むバッファの長さをの指定

  oval1 = 70;
}

void draw() {
  background(0);

  text("Output port: "+oval1, 10, 100);
}

// シリアルポートにデータが受信されると呼び出されるメソッド
void serialEvent(Serial port) {
  inByte = port.readBytes();

  if(firstContact == false) {
    if(inByte[0] == 'C') { // Arduinoとの接続確認
      port.clear();
      firstContact = true;
      sendServo(1, 70);
      sendServo(2, 70);
    } 
  }
}

// シリアルポートにサーボの値を送るメソッド
void sendServo(int id, int value)
{
  if(!firstContact) return;
  int v = value;
  if(v < 15) v = 15; // サーボの最小値。個体差による。
  if(v > 125) v = 125; // サーボの最大値。個体差による。
  serialPort.write((byte)'S');
  serialPort.write((byte)id);
  serialPort.write((byte)v);
}

// キー入力メソッド。デバッグ用。
void keyPressed() {
  switch(key){
  case 'z':
    oval1 += 1; // zキーがおされたら値を1増やす。
    sendServo(int(id)+1, oval1);
    break;
  case 'x':
    oval1 -= 1; // xキーがおされたら値を1減らす。
    sendServo(int(id)+1, oval1);
    break;
  case 'c':
    oval1 = 15;
    sendServo(int(id)+1, oval1);
    break;
  case 'v':
    oval1 = 125;
    sendServo(int(id)+1, oval1);
    break;
  case 'a':
    id = !id;
    break;
  default:
    break;
  }
}
