Number Guessing Game on Flow EVM
Contract Address: 0xe4e85836F57Bb9716B8218C35768222F4bB41b38

Overview
This project is a simple and fun Number Guessing Game smart contract deployed on the Flow EVM. Players can try to guess a secret number to win a prize. The prize is immediately transferred to the winner’s wallet if the correct guess is made; otherwise, the game continues until someone wins.

Features
Automated Prize Distribution: Winner receives the prize instantly on correct guess.

No External Imports or Constructors: The contract is lean and self-contained for easy deployment and auditing.

Owner Controls: Owner can initialize the game and reclaim unused prize funds if the game ends without a winner.

Transparent Gameplay: All actions (initialization, guesses, prize claims) are on-chain.

How It Works
Game Initialization:
The owner starts the game by calling initGame(uint256 _secretNumber) and sending the prize amount in ETH.

Playing the Game:

Anyone may call guess(uint256 _guess) with their guessed number.

If the guess matches the secret number, the smart contract transfers the prize to the winner’s wallet and ends the game.

Prize Recovery:
If the game finishes without a winner, the owner can reclaim leftover funds with reclaimPrize().

Usage
Deployment
This contract is deployed on the Flow EVM at:

text
0xe4e85836F57Bb9716B8218C35768222F4bB41b38
Interface
Methods
initGame(uint256 _secretNumber)
Call this method (by owner) to start a new game. Send prize ETH with this call.

guess(uint256 _guess)
Call this method with your guess.

reclaimPrize()
Called by owner to reclaim funds if no winner.

contractBalance()
View current contract balance.

Example
text
// Initialize the game with a secret number and send ETH as prize:
contract.initGame{value: 1 ether}(1234);

// Guess the number:
contract.guess(1234); // If correct, prize transferred to caller
Requirements
Flow EVM wallet (e.g., MetaMask, Flow-compatible wallet)

ETH for gas and prize payments

License
MIT

Play, win, and enjoy!
