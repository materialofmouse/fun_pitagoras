import de.looksgood.ani.*;
test a = new test(500,500,50,50,"ellipse");
float ballX = 2000;
float ballY = -50;
float eff1 = 0;
float eff2 = 0;
float eff3 = 0;
float eff4 = 0;
float eff5_1 = -400;
float eff5_2 = 2000;
float landR = 1920;
float landL = -920*2;
float switch_height = 20;
int effCnt = 0;
boolean ballVisible = true;
void setup(){
	//fullScreen();
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
  seq.add(Ani.to(this, 1.5, "eff5_1", 200));
  seq.add(Ani.to(this, 2, "eff5_2", -1000));
  seq.endStep();
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
    fill(130);
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
  rotate(PI/6);
  rect(eff5_1,eff5_2,650,3000);
}
