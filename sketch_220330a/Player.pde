import java.awt.event.KeyEvent;

class Player extends Collider{
  PVector vel = new PVector(0, 0);
  Platform platform = null;
  
  KeyInput space = new KeyInput(' ', 0);
  KeyInput left = new KeyInput(CODED, LEFT);
  KeyInput right = new KeyInput(CODED, RIGHT);
  
  public Player(float x, float y, float size){
    super(x, y, size, size);
  }
  
  void jump(){
    if(platform == null){
      return;
    }
    
    vel.add(0, -5, 0);
    platform = null;
  }
  
  void resolveCollision(Platform other){
    PVector collision = calculateOverlay(other);
    if(abs(collision.x) < abs(collision.y)){
      x += collision.x;
      vel.x = 0;
    }
    else {
      y += collision.y;
      vel.y = 0;
      if(y < other.y){
        platform = other;
      }
      else{
        platform = null;
      }
    }
  }
  
  void move(){
    if(platform != null && (x + w < platform.x || x > platform.x + platform.w)){
      platform = null;
    }
    
    if(platform == null){
      float gravity = space.isPressed ? 0.08 : 0.15;
      vel.add(0, gravity, 0);
    }
    
    float speed = platform == null ? 2.5 : 0.5;
    float deacceleration = platform == null ? 0.75 : 0.95;  
    
    float xInput = 0;
    if(left.isPressed){
      xInput -= speed;
    }
    if(right.isPressed){
      xInput += speed;
    }
      
    vel.x = (vel.x + xInput) * deacceleration;
    
    x += vel.x;
    y += vel.y;
    
    if(y + h >= height){
      vel.y = 0;
      platform = new Platform(0,0,0,0);
    }
    
    if(x < 0){
      x = 0;
      vel.x = 0;
    }
    else if(x + w > width){
      x = width - w;
      vel.x = 0;
    }
  }
  
  void draw(){
    fill(0, 0, 255);
    rect(x, y, w, h, 3f);
  }
  
  void keyPressed(){
    space.keyPressed();
    left.keyPressed();
    right.keyPressed();
    
    if(space.isPressed){
      jump();
    }
  }
  
  void keyReleased(){
    space.keyReleased();
    left.keyReleased();
    right.keyReleased();
  }
}
