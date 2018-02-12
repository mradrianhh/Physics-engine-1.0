class Earth{
  Calculations calcs;
  GravitationalField gravitationalField;
  
  PVector gravity;
  PVector opposingForce;
  PVector location;
  
  float c_friction;
  
  //draw variable
  float diameter = 50;
  boolean fixed = true;
  float elasticity = 1;
  
  //constants
  float radius;
  float mass = 5980000000000000000000000.0;
  float gravitationalFieldStrength;
  float gravitationalFieldRadius = 200;
  
  Earth(){
    //initiate variables
    calcs = new Calculations();
    
    radius = 6380000 * calcs.meter;
    gravitationalFieldStrength = calcs.getGravitationalFieldStrength(calcs.gravityConstant, this.mass, this.radius);

    location = new PVector(width/2, height/2);
    
    gravitationalField = new GravitationalField(location.x, location.y, gravitationalFieldRadius * 2);
    
  }
  
  void move(){

  }
  
  void display(){
    displayGravitationalField();
    displayPlanet();
  }
  
  void displayGravitationalField(){
    gravitationalField.update();
    gravitationalField.display();
  }
  
  void displayPlanet(){
    rectMode(CENTER);
    fill(255,255,0,100);
    ellipse(location.x, location.y, diameter, diameter); 
  }

}