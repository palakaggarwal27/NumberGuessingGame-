// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NumberGuessingGame {
    uint256 private secretNumber;
    uint256 public prize;
    address public winner;
    bool public gameActive = true;
    address public owner;

    // Set the contract creator as owner and initialize the secret number and prize
    function initGame(uint256 _secretNumber) external payable {
        require(owner == address(0), "Game already initialized");
        require(msg.value > 0, "Prize must be greater than zero");
        owner = msg.sender;
        secretNumber = _secretNumber;
        prize = msg.value;
    }

    // Allow guessing until there's a winner
    function guess(uint256 _guess) external {
        require(gameActive, "Game over");
        require(prize > 0, "No prize available");
        require(_guess > 0, "Guess must be positive");

        if (_guess == secretNumber) {
            winner = msg.sender;
            gameActive = false;
            payable(msg.sender).transfer(prize);
        }
    }

    // In case no one wins, owner can reclaim the prize
    function reclaimPrize() external {
        require(!gameActive, "Game is still active");
        require(msg.sender == owner, "Only owner can reclaim");
        require(address(this).balance > 0, "No balance to reclaim");
        payable(owner).transfer(address(this).balance);
    }

    // Function to check contract balance
    function contractBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
