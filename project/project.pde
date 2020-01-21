import de.looksgood.ani.*;

float x = 0;
test a = new test(500,500,50,50,"ellipse");

void setup(){
	fullScreen();
	smooth();
	noStroke();
	Ani.init(this);
	a.moveX(2,900);
}

void draw(){
	background(255);
	a.display();
	fill(0);
}
