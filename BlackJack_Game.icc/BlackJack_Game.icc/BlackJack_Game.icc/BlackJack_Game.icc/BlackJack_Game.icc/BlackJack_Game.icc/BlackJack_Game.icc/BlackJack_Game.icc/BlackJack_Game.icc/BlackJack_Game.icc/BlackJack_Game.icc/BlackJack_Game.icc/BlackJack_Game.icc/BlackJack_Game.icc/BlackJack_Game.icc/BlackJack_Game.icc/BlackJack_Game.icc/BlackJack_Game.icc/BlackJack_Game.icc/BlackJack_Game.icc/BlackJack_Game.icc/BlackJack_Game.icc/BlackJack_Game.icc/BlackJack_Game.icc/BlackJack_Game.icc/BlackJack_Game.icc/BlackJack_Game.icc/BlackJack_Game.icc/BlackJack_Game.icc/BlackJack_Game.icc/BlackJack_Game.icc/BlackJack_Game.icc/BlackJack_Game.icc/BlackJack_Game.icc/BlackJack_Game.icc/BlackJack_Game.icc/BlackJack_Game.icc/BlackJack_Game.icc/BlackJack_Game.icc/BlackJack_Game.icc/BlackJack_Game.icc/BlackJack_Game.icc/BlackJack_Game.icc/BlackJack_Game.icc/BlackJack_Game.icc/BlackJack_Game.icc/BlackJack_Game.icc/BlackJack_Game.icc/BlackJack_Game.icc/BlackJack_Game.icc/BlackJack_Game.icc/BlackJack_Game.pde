Button betButton, hitButton, standButton, dealButton, fiveButton, tenButton, twentyButton; // type of variable!! int, boolean, image, name,Array list
Dealer dealer;
Deck deck;// Deck is the class Deck - deck with a small deck is the name of our variable it can be anything
Player player;
boolean overHitButton, overStandButton, overDealButton, overFiveButton, overTenButton, overTwentyButton;// here we declare our variables!!
int hitButtonC, standButtonC, dealButtonC;
int fiveButtonC, tenButtonC, twentyButtonC;
int pbasePos, dbasePos, cardOffset, betAmount, buttonHeight, buttonWidth;
PImage bg, chips, dealerCard, playerCard;
String msg;
String chipAmount;

public void settings() {
  size(1280, 644);
}

public void setup() {// here we initialise the variables 
  //size(1280,644);
  bg = loadImage("table.png");// setup the background image from data folder
  background(bg);
  overHitButton = overStandButton = overDealButton = overFiveButton = overTenButton = overTwentyButton = false;// initialise variables for buttons hit,stand,deal,five,ten,twenty on the right hand side of the screen
  buttonWidth = 80;// assign a value to the variables// buttons width
  buttonHeight = 40; //button height
  dealButton = new Button("Deal");
  hitButton = new Button("Hit");
  standButton = new Button("Stand");

  setCardPos();//this is the position (x,y) of the cards// this calls a method in this class position of the cards void setCardPos() 
  cardOffset = 65;//part of the position used to calculate the rest of the cards 

  deck = new Deck();
  dealer = new Dealer();
  player = new Player();
  player.setChipStack(100);
  betAmount = 0;

  setMsg("Place Your Bets!");// msg at the start of the game

  deck.shuffle();// this calls a method in our deck class  public void shuffle() for shuffling the cards
}
//display msg
public void setMsg(String msg) {// method for the msg at the beggining of the code
  textSize(20);// size of text at the start of the game
  text(msg, 440, 44, 400, 100); // text position
}

public void draw() {
  update(mouseX, mouseY);// calling the update method ( passes the mouseX,mouseY) we do not declare they are declared by processing
  stroke(255); // outine of the buttons
  strokeWeight(4);// weight of the outline of the buttons
  //noStroke();
  if (dealButton.isActive()) {// if the mouse is over the deal button 
    initDealButton();// initialise the deal button
  } else if (hitButton.isActive()) {
    initHitStandButton();
  }

  createBetButtons();// calling the method void createBetButtons()
  //Chip Count
  fill(51, 26, 0);
  rect(1120, 530, 150, 50, 14, 14, 14, 14); 
  chipAmount = player.getChipStack() +" ";//forcing into a String.Casting
  fill(250, 250, 0);
  textSize(20);
  textAlign(CENTER);
  text(chipAmount, 1195, 555);
}
//this is a method to create the bet buttons(five,ten,twenty)
void createBetButtons() {
  fill(twentyButtonC);// twenty chip stack button at the right hand side of the screen , chip value 20 
  // widht with red is the size of the window /2 gives the center       x                            y
  twentyButton = new Button(buttonWidth, buttonHeight, "Twenty", width-(buttonWidth+10)/*x*/, height-buttonHeight-10);/*y*/
  //move the x on all three buttons // position of the 20 button
  twentyButton.setText();

  fill(tenButtonC);
  tenButton = new Button(buttonWidth, buttonHeight, "Ten", width-(buttonWidth+100), height-buttonHeight-10);// position of the 10 button
  tenButton.setText();

  fill(fiveButtonC);
  fiveButton = new Button(buttonWidth, buttonHeight, "Five", width-(buttonWidth+190), height-buttonHeight-10);
  fiveButton.setText();
}
//this is a method to init the deal button, set it's pos and size
void initDealButton() {
  fill(dealButtonC);
  dealButton.init(buttonWidth, buttonHeight, "Deal", (width/2)+buttonWidth/2+10, height-buttonHeight-10);
  dealButton.setText();
}
//this is a method to init the hit and stand buttons, set it's pos and size
void initHitStandButton() {
  fill(hitButtonC);
  // widht with red is the size of the window /2 gives the center
  hitButton.init(buttonWidth, buttonHeight, "Hit", (width/2)-(buttonWidth+buttonWidth/2)-10, height-buttonHeight-10); 
  hitButton.setText();

  fill(standButtonC);
  standButton.init(buttonWidth, buttonHeight, "Stand", width/2-buttonWidth/2, height-buttonHeight-10);
  standButton.setText();
}
//check mouse pos to see if it is over any buttons
void update(int x, int y) {
  if (overHitButton((width/2)-(buttonWidth+buttonWidth/2)-10, height-buttonHeight-10, buttonWidth, buttonHeight)) {// this statement checks if we are over the button Hit
    overHitButton = true;
    //System.out.println("over hit");
  } else {
    overHitButton = false;
  }

  if (overStandButton(width/2-buttonWidth/2, height-buttonHeight-10, buttonWidth, buttonHeight)) {// this statement checks if we are over the button Stand
    overStandButton = true;
    //System.out.println("over stand");
  } else {
    overStandButton = false;
  }

  if (overDealButton((width/2)+buttonWidth/2+10, height-buttonHeight-10, buttonWidth, buttonHeight)) {// this statement checks if we are over the button Deal
    overDealButton = true;
    //System.out.println("over deal");
  } else {
    overDealButton = false;
  }


  if (overFiveButton(width-(buttonWidth+190), height-buttonHeight-10, buttonWidth, buttonHeight)) {// this statement checks if we are over the button Five
    overFiveButton = true;
    //System.out.println("over hit");
  } else {
    overFiveButton = false;
  }

  if (overTenButton(width-(buttonWidth+100), height-buttonHeight-10, buttonWidth, buttonHeight)) {// this statement checks if we are over the button Ten
    overTenButton = true;
    //System.out.println("over stand");
  } else {
    overTenButton = false;
  }

  if (overTwentyButton(width-(buttonWidth+10), height-buttonHeight-10, buttonWidth, buttonHeight)) {// this statement checks if we are over the button Twenty
    overTwentyButton = true;
    //System.out.println("over deal");
  } else {
    overTwentyButton = false;
  }
}
//overXButton methods return true if the mouse pointer is over each button
boolean overHitButton(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height) {//  && all 4 need to be true. returning a boolean if we are over the button we set the color accordingly
    hitButtonC = color(255); //white
    return true;
  } else {
    hitButtonC = color(51, 26, 0);// if we are not over the button color is brown to start with
    return false;
  }
}
boolean overStandButton(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height) {
    standButtonC = color(255);
    return true;
  } else {
    standButtonC = color(51, 26, 0);
    return false;
  }
}
boolean overDealButton(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height) {
    dealButtonC = color(255);
    return true;
  } else {
    dealButtonC = color(51, 26, 0);
    return false;
  }
}

boolean overFiveButton(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height) {
    fiveButtonC = color(255);
    return true;
  } else {
    fiveButtonC = color(51, 26, 0);
    return false;
  }
}
boolean overTenButton(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height) {
    tenButtonC = color(255);
    return true;
  } else {
    tenButtonC = color(51, 26, 0);
    return false;
  }
}
boolean overTwentyButton(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height) {
    twentyButtonC = color(255);
    return true;
  } else {
    twentyButtonC = color(51, 26, 0);
    return false;
  }
}
//mouse has been clicked, check if over button and buttons active
public void mousePressed() {
  if (overHitButton && hitButton.isActive()) {
    playerDraws();// calls a method void playerDraws() 
    dealButton.setActive(false);
    hitButton.setActive(true);// hit button is active
    standButton.setActive(true);// stand button is active
    //System.out.println("Hit button pressed");
  }
  if (overStandButton && standButton.isActive()) {
    dealerDraws();// calls a method
    dealButton.setActive(false);
    hitButton.setActive(false);
    standButton.setActive(false);
    //System.out.println("Stand button pressed");
  }
  if (overDealButton && dealButton.isActive()) {
    if (deck.getDeck().size() > 20) {
      dealButton.setActive(false);// set to false . not to be displayed until the hand is over
      hitButton.setActive(true);
      standButton.setActive(true);
      startGame();
    } else {
      //Ran out of cards
      deck.createDeck();
      deck.shuffle();

      dealButton.setActive(false);
      hitButton.setActive(true);
      standButton.setActive(true);
      startGame();
    }
  }

  if (overFiveButton) {
    //System.out.println("Five button pressed");
    dealButton.setActive(true);
    hitButton.setActive(false);
    standButton.setActive(false);
    betAmount = 5;
    chips =loadImage("fiveChip.png");
    image(chips, 610, 460, 60, 45);
  }
  if (overTenButton) {
    //System.out.println("Ten button pressed");
    dealButton.setActive(true);
    hitButton.setActive(false);
    standButton.setActive(false);
    betAmount = 10;
    chips =loadImage("tenChip.png");
    image(chips, 610, 460, 60, 45);
  }
  if (overTwentyButton) {
    //System.out.println("Twenty button pressed");
    dealButton.setActive(true);
    hitButton.setActive(false);
    standButton.setActive(false);
    betAmount = 20;
    chips =loadImage("twentyChip.png");
    image(chips, 610, 460, 60, 45);
  }
}
//this is callled after the background has been reset. It replaces any bets that are still active but were cleared as a result of calling background()
void replaceBetChips() {// helper function to clear the screen to remove unwanted buttons or cards .this method replaces the bets
  if (betAmount == 5) {
    chips =loadImage("fiveChip.png");
    image(chips, 610, 460, 60, 45);
  } else if (betAmount == 10) {
    chips =loadImage("tenChip.png");
    image(chips, 610, 460, 60, 45);
  } else if (betAmount == 20) {
    chips =loadImage("twentyChip.png");
    image(chips, 610, 460, 60, 45);
  }
}
//deciding which hand was better
void settleBet() {// the last method to be called in each hand. Testing hands in this method
  if (dealer.getHandValue() <= 21 && player.getHandValue() <= 21) {
    if (dealer.getHandValue() < player.getHandValue()) {
      player.setChipStack(player.getChipStack() + betAmount);
    } else if (dealer.getHandValue() > player.getHandValue()) {
      player.setChipStack(player.getChipStack() - betAmount);
    } else if (dealer.getHandValue() == player.getHandValue()) {
      //Push
    }
  } else if (dealer.getHandValue() > 21) {
    player.setChipStack(player.getChipStack() + betAmount);// add to the chip stack
  } else if (player.getHandValue() > 21) {
    player.setChipStack(player.getChipStack() - betAmount);// substract from the chip stack
  }

  background(bg);
  placeCards();
  //replaceBetChips();

  dealButton.setActive(true);
  hitButton.setActive(false);
  standButton.setActive(false);

  setMsg("Dealer has : "+dealer.getHandValue()+"    Player has : "+ player.getHandValue()+"\n Place Your Bet!");
}
//This is the beggining of the game where the player gets two cards and the dealer one,
void startGame() {
  background(bg);//clear screen
  replaceBetChips();//replace the bet
  setCardPos();//reset card pos

// the following claers any data from old hands
  player.clearHand();// calls a method in the player class public void clearHand()
  player.setHandValue(0);// calls a method in the player class
  dealer.clearHand();// calls a method in the dealer class public void clearHand()
  dealer.setHandValue(0);// calls a method in the dealer class public void clearHand()

  playerDraws();
  dealerDrawsOne();
  playerDraws();
}
//in order to show the correct buttons I had to call background() This causes the card to be cleared
//This method replaces the cards
void placeCards() {
  setCardPos();
  for (Card card : player.getHand()) {
    playerCard = loadImage(card.toString()+".png");
    image(playerCard, pbasePos, 360, 60, 80);
    pbasePos+=cardOffset;//phasePos 580, cardOffset 65
  }
  for (Card card : dealer.getHand()) {
    dealerCard = loadImage(card.toString()+".png");
    image(dealerCard, dbasePos, 220, 60, 80);
    dbasePos+=cardOffset;//phasePos 580, cardOffset 65
  }
}
//Player takes one card 
void playerDraws() {
  if (player.getHandValue() < 21) {

    Card tmp = new Card();
    tmp = deck.getNextCard();
    player.addCardtoHand(tmp);
    playerCard = loadImage(tmp.toString()+".png");
    image(playerCard, pbasePos, 360, 60, 80);
    pbasePos+=cardOffset;
    //System.out.println("player has : " + player.getHandValue());
  }

  if (player.getHandValue() > 21) {
    settleBet();
    dealButton.setActive(true);
    hitButton.setActive(false);
    standButton.setActive(false);
  }
}
//dealer takes one card
void dealerDrawsOne() {
  Card tmp = new Card();

  tmp = deck.getNextCard();
  dealer.addCardtoHand(tmp);
  dealerCard = loadImage(tmp.toString()+".png");// load image from data folder
  image(dealerCard, dbasePos, 220, 60, 80);
  dbasePos += cardOffset;
}
//dealer takes as many cards as needed to reach 17 or higher 
void dealerDraws() {
  Card tmp = new Card();

  while (dealer.getHandValue() < 17) { 
    tmp = deck.getNextCard();   
    dealer.addCardtoHand(tmp);
    dealerCard = loadImage(tmp.toString()+".png");
    image(dealerCard, dbasePos, 220, 60, 80);
    dbasePos += cardOffset;
  }
  settleBet();
}
//card starting pos
void setCardPos() {
  pbasePos = 580;// player card pos
  dbasePos = 580;//dealer card pos
}