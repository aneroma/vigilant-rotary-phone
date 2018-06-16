import java.util.ArrayList;

public class Player{
  private int chipStack;
  private int handValue;
  private ArrayList<Card> hand;//all cards in the player's hand are stored here
  
  Player(){//constructor no return type
    hand = new ArrayList<Card>();
  }
  //get the players total number of chips
  public int getChipStack(){ 
    return chipStack;
  }
  public void setChipStack(int chipStack) { // int chipstack belongs to the method -this. chip stack belongs to the class
    this.chipStack = chipStack;
  }
  public ArrayList<Card> getHand(){
    return hand;
  }
  public int getHandValue(){ 
    return handValue;
  }
  public void setHandValue(int handValue){
    this.handValue = handValue;
  }
  public void addToHandValue(int handValue){
    this.handValue += handValue;
  }
  
  public void addCardtoHand(Card newCard){
    int rValue;
      hand.add(newCard);
      rValue = newCard.getRealValue(newCard.getValue());
      rValue = newCard.softAce(rValue, handValue);
      addToHandValue(rValue);
      //System.out.println("PLAYER Adding : "+rValue);
  }
  public void clearHand(){// method that doesen't return anything
    hand.clear();// clear the arraylist// clear is a method that is inside the arraylist like remove or shuffle
    handValue = 0;// staring from 0 new hand//
  }
}
//Getters and setters encapsulate the fields of a class by making them accessible only through its public methods and keep the values themselves private. ...
//Getter and setter method are used to get and set the value of x which is the way to achive encapsulation.