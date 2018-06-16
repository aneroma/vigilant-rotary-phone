import java.util.*;

public class Deck{
  private ArrayList<Card> cards;
  
  public Deck(){//constructor no return type
    //cards = new Card[52]; //https://beginnersbook.com/2013/12/java-arraylist/
    cards = new ArrayList<Card>(); //https://stackoverflow.com/questions/8520808/how-to-remove-specific-object-from-arraylist-in-java.
    createDeck();
  }
  
  public void createDeck(){
    cards.clear();
    //int counter = 0;// old from the array
      /*
      this is a for loop to setup the suit(a) and value(b) of the cards
      setValue(b+1) so we dont start at 0
      */
    for(int j = 0; j <6;j++){// this is 6 decks
      for(int a=0; a<=3; a++){//this is 4 suits
        for(int b=0; b<=12; b++){//this is 13 cards
          Card newCard = new Card();
          cards.add(newCard);
          newCard.setSuit(a);
          newCard.setValue(b+1);
          //counter++;// from the old array
        }
      }
    }
  }
  //this is a method for shuffling
  public void shuffle(){ 
    Collections.shuffle(cards);
  
  }
  //this method returns the full deck
  public ArrayList<Card> getDeck(){
    return cards;
  }
  //get the next card from the deck
  public Card getNextCard(){
    Card tempCard = new Card();
    tempCard = cards.get(0);
    cards.remove(0);
    return tempCard;
  }
}
//Getters and setters encapsulate the fields of a class by making them accessible only through its public methods and keep the values themselves private. ...
//Getter and setter method are used to get and set the value of x which is the way to achive encapsulation.