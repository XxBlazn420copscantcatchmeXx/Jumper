Player player;
ArrayList<Platform> platforms;

void setup(){
  size(450, 800);
  //frameRate(10);
  player = new Player(width/2, height-60, 16);
  platforms = new ArrayList<Platform>();
  platforms.add(new Platform(-5, height - 35, width + 10, 30));
  platforms.add(new Platform(150, height - 100, 100, 20));
  platforms.add(new Platform(30, height - 215, 50, 20));
  platforms.add(new Platform(300, height - 315, 50, 20));
  platforms.add(new Platform(20, height - 385, 10, 20));
  platforms.add(new Platform(150, height - 500, 50, 20));
}

void draw(){
  background(255);
  player.move();
  for(Platform platform : platforms){
    if(player.isColliding(platform)){
      platform.draw(color(0, 0, 255));
      player.resolveCollision(platform);
    }
    else{
      platform.draw(color(255, 0, 0));
    }
  }
  player.draw();
}

void keyPressed(){
  player.keyPressed();
}

void keyReleased(){
  player.keyReleased();
}
