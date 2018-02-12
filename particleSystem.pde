
class ParticleSystem{
  ArrayList<Mover> movers;
  
  ParticleSystem(float x, float y){
    movers = new ArrayList<Mover>();
    for(int i = 0; i < 10; i++){
      movers.add(new Mover(x, y)); 
    }
  }
  
  void run(){
    
    for(int i = movers.size()-1; i >= 0; i--){
      Mover mover = movers.get(i);
      mover.update();
      mover.display();
    }
    
  }
  
  void move(Earth earth){
    for(int i = 0; i < movers.size();i++){
      Mover mover = movers.get(i);
      if(calcs.calculateDist(mover.location, earth.location) < 200){
        calcs.applyForce(calcs.createForce(earth.gravitationalFieldStrength, calcs.createUnitVector(mover.location, earth.location)), mover);
      }

    
      mover.update();
      mover.display();
    }
  }

}