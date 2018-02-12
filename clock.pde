class Clock{
  int hour;
  int minute;
  int second;
  
  Clock(){
    hour = hour();
    minute = minute();
    second = second();
  }
  
  void update(){
    hour = hour();
    minute = minute();
    second = second();
  }
  
  void show(){
    fill(255);
    text(hour + ":" + minute + ":" + second, 10, 10);
  }

}