
/*
Create a universal object(particle?), which every object inherits from?
Planet class? Planet inherits particle?
Collision?
Universe? Launch class = universe? Universe controls everything? god?

Star/planet?
  Forces:
    -Gravity
  -Friction
  -Drag(Resistance)
  -Pull
  -Push
Base classes == Universe & particle? Auxiliary classes inherits particle?
Newtons third law!!!
Example 1:

location = [0,0]
  velocity = [0,0]
  acceleration = [0,0]
  gravity = [0,1]
  acceleration.add(gravity);  
  velocity.add(acceleration);
  location.add(velocity);
 
  0s:
    location = [0,0]

    velocity = [0,0]

acceleration = [0,0]r  1s:
    location = [0,1]
    velocity = [0,1]
    acceleration = [0,1]
  2s:
    location = [0, 3]
    velocity = [0, 2]
    acceleration = [0,1]
  3s:
    acceleration = [0,1]
    velocity = [0,3]
    location = [0,6]
    opposingForce = (velocity + acceleration)*-1
    acceleration.add(opposingForce)
  4s:
    acceleration = [0,-3]
    velocity = [0,0]
    location = [0,6]
  Pseudo code based on results:
  if(contact){
    opposingForce = velocity.add(acceleration);
    opposingForce.mult(-1);
    p.applyForce(opposingForce);
  }
  
  for(Particle particle : particles){
    for(Planet planet : planets){
      particle.applyForce(createForce(calculateGravity(gravityConstant, particle.mass, planet.mass, calculateDist(particle.location, planet.location)), createUnitVector(particle.location, planet.location)), particle);
      
    }
  }
  
  boolean checkContact(Planet planet, Particle particle){
    if(calculateDist(planet.location, particle.location <= (planet.diameter + particle.diameter)){
      return true;
    }else{
      return false;
    }
  }
  
  for(int i = particles.size()-1; i >= 0; i--){
    Particle particle = particles.get(i);
    for(int j = planets.size()-1; j >= 0; j--){
      Planet planet = planets.get(j);
      if(checkContact(planet, particle){
        particle.remove(i);
      }
    }
  }
  
*/
Earth earth;
Calculations calcs;
PVector acceleration;
ArrayList<ParticleSystem> particleSystems;
Clock clock;

void setup(){
  size(500,500);
  earth = new Earth();
  calcs = new Calculations();
  particleSystems = new ArrayList<ParticleSystem>();
  clock = new Clock();
}

void draw(){
  background(0);
  
  earth.display();
  earth.move();
  
  for(int i = 0; i < particleSystems.size();i++){
    ParticleSystem particleSystem = particleSystems.get(i);
    particleSystem.run();
    particleSystem.move(earth);
    
    for(int j = 0; j < particleSystem.movers.size();j++){
      Mover mover = particleSystem.movers.get(j);
      checkContact(earth, mover);
    }
  }
  
  clock.update();
  clock.show();
}

void checkContact(Earth earth, Mover mover){
  if(calcs.calculateDist(mover.location, earth.location) <= 200){
    calcs.applyForce(calcs.createForce(calcs.calculateGravity(calcs.gravityConstant, 1, mover.mass, calcs.calculateDist(mover.location, earth.location)), calcs.createUnitVector(mover.location, earth.location)), mover);
  }
}

void mouseClicked(){
  if(mouseButton == RIGHT){
    earth.location.x = mouseX;
    earth.location.y = mouseY;
  }else if(mouseButton == LEFT){
    particleSystems.add(new ParticleSystem(mouseX, mouseY));
  }

}
