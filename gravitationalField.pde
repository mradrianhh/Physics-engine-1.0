class GravitationalField{
  PVector location;
  float x;
  float y;
  float diameter;
  
  GravitationalField(float x, float y, float diameter){
    this.x = x;
    this.y = y;
    this.diameter = diameter;
    location = new PVector(this.x, this.y);
  }
  
  void update(){
    location = new PVector(this.x, this.y);
  }
  
  void display(){
    fill(25);
    ellipse(location.x, location.y, diameter, diameter);
  }
  
}