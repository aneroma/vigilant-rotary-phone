public class Dealer{
  private int handValue;// private means that no other class can use that class// variable 
  private ArrayList<Card> hand;// ArrayList
  
  
  Dealer(){// constructor neds to have the same name as the class . we can have more than 1 constructor. we can pass things into it//constructor no return type
    hand = new ArrayList<Card>();
  }
  public ArrayList<Card> getHand(){
    return hand;
  }
  public int getHandValue(){ // method
    return handValue;
  }
  public void setHandValue(int handValue){// method
    this.handValue = handValue;
    
  }
  public void addToHand(int handValue){// method
    this.handValue += handValue;
    
  }
  
  public void addCardtoHand(Card newCard){// method
    int rValue;
    hand.add(newCard);
    rValue = newCard.getRealValue(newCard.getValue());
    rValue = newCard.softAce(rValue, handValue);
    addToHand(rValue);
    //System.out.println("DEALER Adding : "+rValue);

  }
  public void clearHand(){
    hand.clear();// clear the arraylist// clear is a method that is inside the arraylist like remove or shuffle
    handValue = 0;// staring from 0 new hand//
  }
}
//Getters and setters encapsulate the fields of a class by making them accessible only through its public methods and keep the values themselves private. ...
//Getter and setter method are used to get and set the value of x which is the way to achive encapsulation.