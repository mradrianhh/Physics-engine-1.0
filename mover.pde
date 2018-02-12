class Mover{
  //gravity constant 9.81 m/s^2 = 37077.165354331 px / s^2, 0.00981 cm/s^2 = 37.077165354 px/s^2
  //gravity = (gravityConstant * mass1 * mass2)/distance between objects
  //every variable is converten in the sense that one meter gets represented as one centimeter, thus every value which represents meter 
  //must be multiplied with 100
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  int forces = 0;
  
  ///////////////////////
  
  float mass = 1;
  
  /////////////////
  //complex/specific units
  //diameter in pixel
  float radius = 5;
  //height of object
  float objectHeight;
  //force of object
  PVector force;
  //netforce between vectors
  float netforce;
  
  ///////////////////////
  
  Mover(float x, float y){
  
    location = new PVector(x, y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0, 0);
  }
  
  void update(){
    //edges();
    //setSeconds();
    
    location.add(velocity);
    velocity.add(acceleration);
    acceleration.mult(0);
    netforce = 0;
    forces = 0; 
    velocity.limit(10);
 
  }
  
  void edges(){
    if(location.y > height){
      location.y = 0;
    }
    if(location.x > width){
      location.x = 0;
    }
  }
  
  void display(){
    fill(255,100);
    
    ellipse(location.x, location.y, radius*2, radius*2);
    
  }
  
  /////////////////////////////
  
  
  //help functions
  float toThePowerOf(float expression, float x){
    float result = 1;
    if(x == 0){
      result = 1;
    }else{
      for(int i = 1; i <= x; i++){
        result *= expression;
      }
    }
    return result;
  }
  
  void setNetforce(PVector force){  
    netforce += force.x + force.y;
  }

}