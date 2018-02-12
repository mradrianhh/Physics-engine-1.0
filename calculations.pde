class Calculations{
  
   //scalar units, such as newton, joule, meters, SI-units
  //meter in pixels, where one centimeter on the screen represents one meter
  float meter = 37.79527559055;
  //newton in (px*kg)/s^2
  float newton = meter;  
  //second in second
  float seconds = 1;
  //gravityConstant in (px*kg*px^2)/s^2 * kg^2
  float gravityConstant = 0.0000000000667 * newton * pow(meter,2); //3601126.547;
  //joule - kg * (m^2/s^2), where  m = meter(px)
  float joule = pow(meter, 2);
  //radius of earth in pixel
  //float meters = 1;
  float timeMeasure = second();
  
  Calculations(){
  }
  
  //PHYSICS CALCULATIONS
  
  //Calculate magnitudes
  float calculateVelocity(float meters, float seconds){
    float result = 0;
    
    result = meters/seconds;
    
    return result;
  }
  
  float calculateAcceleration(float velocity, float seconds){
    float result = 0;
    
    result = velocity / seconds;
    
    return result;
  }
  
  float calculateGravity(float gravityConstant, float mass1, float mass2, float r){
    float result = 0;
    
    result = (gravityConstant * mass1 * mass2)/pow(r, 2);
    
    return result;
  }
  
  //Calculate amounts
  
  float calculateDist(PVector vector1, PVector vector2){
    float result = 0;
    
    result = dist(vector1.x, vector1.y, vector2.x, vector2.y);
    
    return result;
  }
  
  float calculatePotentialEnergy(float gravitationalFieldStrength, float mass, float objectHeight){
    float result = 0;
    
    result = mass * gravitationalFieldStrength * objectHeight;
    
    return result;
  }
  
  float calculateKineticEnergy(float mass, float velocity){
    float result = 0;
    
    result = 0.5 * mass * pow(velocity, 2);
     
    return result;
  }
  
  float calculateSpeed(PVector velocity){
    float result = 0;
    
    result = velocity.mag();
    
    return result;
  }
  
  //set functions
  void setSeconds(){
    if(second() - timeMeasure == 1){
      seconds = 1;
      timeMeasure = second();
    }
  }
  
  //get functions
  float getGravitationalFieldStrength(float gravityConstant, float mass, float radius){
    float result = 0;
    
    result = ((gravityConstant * mass) / pow(radius, 2))/100;
    
    return result;
  }
  
  float getObjectHeight(Mover m){
    return height - m.location.y;
  }
  
  //Converters
  float toMeters(float lengthUnit){
    float result = 0;
    
    result = lengthUnit / meter;
    
    return result;
  }
  
  //Create and apply
  void applyForce(PVector force, Mover m){
    PVector f = PVector.div(force, m.mass);
    m.acceleration.add(f);
    m.setNetforce(f);
    m.forces++;
  }
         //from location1 -> location2
  PVector createUnitVector(PVector location1, PVector location2){
    PVector unitVector = PVector.sub(location2, location1);
    unitVector.normalize();
    return unitVector;
  }
  
        //Create a force
  PVector createForce(float magnitude, PVector unitVector){
    return unitVector.mult(magnitude);
  }
  PVector createForce(PVector acceleration, float mass){
    return acceleration.mult(mass);
  }
  
  
}

  