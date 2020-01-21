import de.looksgood.ani.*;

class test{
	boolean visible;
	Ani aniX, aniY;
	float posX, posY;
	float newX, newY;
	float sizeX, sizeY;
	color c;
	String type;

	public test(float __posX, float __posY, float __sizeX, float __sizeY, String __type){
		this.posX = __posX;
		this.posY = __posY;
		this.sizeX = __sizeX;
		this.sizeY = __sizeY;
		this.type = __type;
		this.c = color(0,0,0);
		this.visible = true;
	}

	void visible(){
		this.visible = true;
	}

	void inVisible(){
		this.visible = false;
	}

	void setColor(color __c){
		this.c = __c;
	}

	void setSize(float __sizeX, float __sizeY){
		this.sizeX = __sizeX;
		this.sizeY = __sizeY;
	}

	void move(float __posX, float __posY){
		this.posX = __posX;
		this.posY = __posY;
	}

	float getPosX(){
		return this.posX;
	}

	float getPosY(){
		return this.posY;
	}

	void display(){
		if(type.equals("ellipse")){
			fill(this.c);
			ellipse(this.posX, this.posY, this.sizeX, this.sizeY);
		}
	}
	
	void moveX(float __time, float __x){
		aniX = Ani.to(this, __time, "posX", __x, Ani.QUAD_IN_OUT);
	}
}
