class Platform extends Collider {
  public Platform(float x, float y, float w, float h){
    super(x, y, w, h);
  }
  
  void draw(color platformColor){
    fill(platformColor);
    rect(x, y, w, h);
    
  }
}
