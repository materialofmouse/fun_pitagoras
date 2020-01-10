import de.looksgood.ani.*;

float x;
class test(){
	boolean visible;
	float posX, posY;
	color c;

	test(color __c, float __posX, float __posY, boolean __visible){
		posX = __posX;
		posY = __posY;
		c = __c;
		visible = __visible;
	}

	void setVisible(boolean __visible){
		visible = __visible;
	}

	void setColor(color __c){
		c = __c;
	}

	void animationAddColor(Ani.seq){
		//Ani.seq(this.posX)
	}


void setup(){
	fullScreen();
	smooth();
	noStroke();
	
	Ani.init(this);
	//Ani.to(this, 2, "x", 1700, Ani.LINEAR);
	
	seq = new AniSequence(this);
	seq.beginSequence()

	seq.add(Ani.to(this, 2, "")

}

void draw(){
	background(255);
	ellipse(50,x,60,60);
	fill(0);
}
