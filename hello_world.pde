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