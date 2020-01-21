import de.looksgood.ani.*;

float x = 0;
test a = new test(500,500,50,50,"ellipse");
float ballX = 500;
float ballY = 600;
boolean ballVisible = true;

void setup(){
	fullScreen();
	smooth();
	noStroke();
	Ani.init(this);
	AniSequence seq = new AniSequence(this);

	/*seq.beginSequence();
	seq.add(Ani.to(this, 2,"ballX",900));
	seq.add(Ani.to(this, 2,"ballY",100));
	seq.endStep();
	seq.endSequence();
	seq.start();
  */
	Ani.to(this, 2, "ballX", 1000);
}

void draw(){

	if(ballVisible){
		fill(0,0,0);
		ellipse(ballX,ballY,500,500);
	}
	background(255);
}
