/*
Name :Diana Morena Tifrea
Student number: 15721225

Brief description of the animation achieved:
   I have developed a Black Jack game. Press the five,ten,twenty button to place the bet, 
hit deal for the cards to be dealt. 
Make your decision by hitting the buttons hit or stand. Place you bet and click deal again.
 
Justification of spec:
6 decks are used, as this is standard in a casino in Europe.
 
Known bugs/problems:
Soft Ace where an Ace can be 1 0r 11 .The hand value needs to be re calculated after each card is added to the hand.
An Ace that is taken as 11 maybe required to be downgraded to 1 as new cards are added. 
My code doesn't currently recalculate the Ace. 

To do:
Black Jack made up of two cards, should get paid three to two(1.5).The game currently pays 1 to 1 for all hands.
The game doesen't have the option to double or split as in a normal game.

Flow of the game
SETUP

•  Load background
•  Set up/ initialise variables 
•  Create classes player, dealer,card,deck, button
•  Ask player to place bet
•  Shuffle the deck using an ArrayList   public void shuffle(){ 
    Collections.shuffle(cards);
DRAW
•  Check the mouse position to see if it’s over any of my buttons
•  If it’s the start of a new game then create the deal button else we are already in the middle of a game so show the hit and stand button 
•  Create the bet button and text so the player can see how much they have

Once the player places a bet and click the deal button we begin executing the startGame() method

StartGame()
•  To remove the deal button I needed to wipe the screen, then replace the players bet and the correct buttons.
•  Clear any data from all hands take one card for the player, then one card for the delaer , then the second card for the player. here we check to see if it’s a softAce and to get the real value of the cards and add it to the player and dealer classes.

Once again we wait for the player to decide what to do. The player has two options from here , hit or stand.

•  If the player clicks hit the playerDraws() method will be called the player will then get the next card in the deck
•  If the player clicks stand then the dealerDraws() method will be called and the dealer will get the next card(s) in the deck until he is over 17
•  Once this happens the hand is over so its time to settle the bet settleBet() method is called which checks to see which has the higher hand but under 22 and pays or takes the bet amount
•  Here we set the deal button to active so we can return to return to the start of our game flow.

Update()
•  In the upate method we take in an X and Y
These are the x and y position of the mouse.
•  We check these to see if the mouse is over any of my buttons.
MousePressed()
•  Here we use the results of the update() method to see if we were over any of the buttons when the mouse was pressed.
•  If the mouse was then do what was clicked eg stand = give dealer more cards
Hit+give player more cards



Sources:
Cards from:
Boardgame pack v2 by Kenney Vleugels (www.kenney.nl)
https://www.codegarden11.com/blackjack-table-top-185276.html BLACKJACK table image. I had to resize it to fit my window.

*/