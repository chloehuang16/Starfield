Particle[] bob = new Particle[1000];

void setup() {
  size(400, 400);


  bob[0] = new OddballParticle(200, 200);

  for (int i = 1; i < bob.length; i++) {
    bob[i] = new Particle(200, 200);
  }
}

void draw() {
  background(0);
  for (int i = 0; i < bob.length; i++) {
    bob[i].show();
    bob[i].move();
  }
}

public class Particle {
  protected double myX, myY;
  protected double myColor, myAngle, mySpeed, myOpacity;
  protected float particleStrokeWeight;

  public Particle(int myX, int myY) {
    this.myX = myX;
    this.myY = myY;
    this.myAngle = Math.random() * 2 * Math.PI;
    this.mySpeed = Math.random() * 10;
    this.myOpacity = (int) (Math.random() * 60) + 60;
    this.myColor = color(155, 178, 214);
    this.particleStrokeWeight = 1; 
  }

  void move() {
    myX = myX + (double) (Math.cos(myAngle) * mySpeed);
    myY = myY + (double) (Math.sin(myAngle) * mySpeed);
  }

  void show() {
    strokeWeight(particleStrokeWeight);
    fill((int) myColor, (int) myOpacity);
    ellipse((float) myX, (float) myY, 25, 25);
  }
}

class OddballParticle extends Particle {
  private float endX, endY;

  public OddballParticle(int myX, int myY) {
    super(myX, myY);
    endX = myX;
    endY = myY + 100;
  }

  void move() {

    endX += (Math.random() * 2 - 1); 
    endY += (Math.random() * 2 - 1); 

    
    endX = min(max(endX, 0), width);
    endY = min(max(endY, 0), height);
  }

  void show() {
    super.show();
    stroke(255);
    strokeWeight(10);
    line((float) myX, (float) myY, endX, endY);
    
    fill(255);
    ellipse((float) myX, (float) myY, endX-300, endY-370);
    
    fill(255, 204, 0);
    ellipse(200, 300, 150, 70);
    ellipse(145, 250, 60, 60);
    
    fill(255, 204, 0);
    arc(200, 315, 50, 50, PI, TWO_PI);
    
    fill(245, 140, 99);
    ellipse(120, 255, 40, 20);
    ellipse(245, 340, 40, 30);
    ellipse(155, 340, 40, 30);
  }
}



