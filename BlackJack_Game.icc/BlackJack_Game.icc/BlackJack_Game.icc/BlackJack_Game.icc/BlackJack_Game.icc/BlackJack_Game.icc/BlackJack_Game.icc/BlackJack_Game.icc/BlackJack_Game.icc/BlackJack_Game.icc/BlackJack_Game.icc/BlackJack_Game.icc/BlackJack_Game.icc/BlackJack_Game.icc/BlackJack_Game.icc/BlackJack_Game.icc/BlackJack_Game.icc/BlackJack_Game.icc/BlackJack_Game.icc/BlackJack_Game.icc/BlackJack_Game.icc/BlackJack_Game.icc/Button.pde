public class Button{
  
  private String name;// variable
  private int posx,posy;// variable
  private int sizeX, sizeY;// variable
  private boolean active;// variable

 
  Button(String name){ //constructor no return type
    setName(name);
    active = false;
    
    //ellipse(posx,posy,x,y);
    //parent.rect(posx,posy, x, y,14,14,14,14);
  }
  
  Button(int x, int y, String name, int posx, int posy){ //constructor no return type
    setName(name);
    this.posx = posx;
    this.posy = posy;
    sizeX = x;
    sizeY = y;
    active = false;
    
    //ellipse(posx,posy,x,y);
    rect(posx,posy, x, y,14,14,14,14);
  }
  
  public void init(int x, int y, String name, int posx, int posy){ // method
    setName(name);
    this.posx = posx;
    this.posy = posy;
    sizeX = x;
    sizeY = y;
    rect(posx,posy, x, y,14,14,14,14);
  }
  public void setText(){// method
    fill(250,250,0);
    textSize(20);
    textAlign(CENTER);
    text(name,posx+(sizeX/2),posy+(sizeY/2));
  }
  private void setName(String name){// method
    this.name = name;
  }
  public String getName(){// method
    return name;
  }
  
  public void setActive(boolean active){// method
    this.active = active;
  }
  public boolean isActive(){
    return active;
  }
}