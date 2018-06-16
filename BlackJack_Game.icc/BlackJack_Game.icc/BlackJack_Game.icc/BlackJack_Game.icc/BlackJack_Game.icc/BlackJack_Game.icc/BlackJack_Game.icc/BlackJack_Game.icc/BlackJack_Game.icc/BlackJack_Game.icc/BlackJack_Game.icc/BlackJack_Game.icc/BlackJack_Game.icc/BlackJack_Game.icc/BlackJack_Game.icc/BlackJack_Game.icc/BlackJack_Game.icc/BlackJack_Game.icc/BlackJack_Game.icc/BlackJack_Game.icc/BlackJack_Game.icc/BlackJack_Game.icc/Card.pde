public class Card{
  
  private int posx,posy;
  private int sizeX, sizeY;
  private String name;
  private int value; //private is the access type 
  private int suit;
  
  Card(){//constructor no return type
  }
   public void setText(){
    fill(0,102,153);
    textSize(20);
    textAlign(CENTER);
    text(name,posx+(sizeX/2),posy+(sizeY/2));
  }
  
  public int getValue(){ //int is the return type( because it returns value which is an int
    return value;
  }
  public void setValue(int value){
    this.value = value;// this keyword is used just for the class value not the method value
  }

  public int getSuit(){ //int is the return type( because it returns value which is an int
    return suit;
  }
  public void setSuit(int suit){
    this.suit = suit;// this keyword is used just for the class value not the method value
  }
  
  public int getRealValue(int value){ // real value for the cards . we need this method to set them to 10 not 11,12,13
    int i = 0;
    if(value > 10){
      i = 10;
    }else{
      i = value;
    }
    return i;  
  }

  public int softAce(int cardValue, int handValue){// value for the ace. can be 1 or 11
    int s = cardValue;
    if(cardValue == 1){
      if(handValue + 11 <= 21){
        s = 11;
      }else{
        s = 1;
      }
    } 
    return s;
  }
  
  public String toString(){// 4 suits of the cards
    String temp = ""; 
    switch(this.getSuit()){
      case 0: temp = "cardHearts";
      break;
      case 1: temp = "cardSpades";
      break;
      case 2: temp = "cardDiamonds";
      break;
      case 3: temp = "cardClubs";
      break;
      
    }
    switch(this.getValue()){//value of the cards 
      case  1: temp =  temp  + "A";
      break;
      case 11: temp = temp + "J";
      break;
      case 12: temp = temp + "Q" ;
      break;
      case 13: temp = temp + "K";
      break;
      default: temp = temp + this.getValue();
      break;
    }
  return temp;
  }
}/*A switch statement allows a variable to be tested for equality against a list of values. 
  Each value is called a case, and the variable being switched on is checked for each case.*/
//Getters and setters encapsulate the fields of a class by making them accessible only through its public methods and keep the values themselves private. ...
//Getter and setter method are used to get and set the value of x which is the way to achive encapsulation.