pragma solidity >=0.4.22 <0.9.0;
import './MultiNumberBettingAbstractV1.sol';

contract MultiNumberBettingV5 is MultiNumberBettingAbstractV1 {
    // Winner MultiNumberBettingAbstractV1() 
    struct winner {
        address winnerAddress;
        string name;
        uint8 guess;
        uint guessedAt;
        uint ethersReceived;
    }

    uint loserCount;
    uint winnerCount;
    uint lastWinnerAt;  // time of last winning
    uint8[] arr;  // array of numbers to be guessed (0 to 10)
    address payable lastWinnerAddress;  
    mapping(address => winner) winners;  // mapping to keep track of winners' info

    constructor(uint8 x, uint8 y, uint8 z) public payable {
        arr = [x, y, z];
    }

    /* Lets user guess a number in the array (0-10) */
    function guess(uint8 x, string memory name) public payable returns (bool) {
        require(x <= 10);
        //require(1 ether == 1000000000000000011 wei);
        //assert(1 >= 10); 
        require(msg.value >= MIN_BET && msg.value <= MAX_BET);
        for (uint i=0; i < arr.length; i++) {
            if (arr[i] == x) {
                winnerCount++;
                lastWinnerAddress = msg.sender; 
                lastWinnerAt = now;
                winners[lastWinnerAddress] = winner(lastWinnerAddress, name, x, now, msg.value);
                lastWinnerAddress.transfer(msg.value * 2);
                return true;
            }
        }

        loserCount++;
        return false;
    } 

    function getLoserCount() public view returns (uint) {
        return loserCount;
    }

    function getWinnerCount() public view returns (uint) {
        return winnerCount;
    }

    function daysSinceLastWinning() public view returns (uint) {
        return lastWinnerAt != 0 ? (now - lastWinnerAt) / 1 days : 0;
    }

    function hoursSinceLastWinning() public view returns (uint) {
        return lastWinnerAt != 0 ? (now - lastWinnerAt) / 1 hours : 0;
    }

    function minutesSinceLastWinning() public view returns (uint) {
        return lastWinnerAt != 0 ? (now - lastWinnerAt) / 1 minutes : 0;
    }

    function getLastWinnerInfo() public view returns (address winnerAddress, string memory name, uint8 guessVal, uint timeGuessed, uint ethersReceived) {
        winner memory lastWinner = winners[lastWinnerAddress];
        winnerAddress = lastWinner.winnerAddress;
        name = lastWinner.name;
        //name = "Kermit";
        guessVal = lastWinner.guess;
        timeGuessed = lastWinner.guessedAt;
        ethersReceived = lastWinner.ethersReceived;
    }

    function checkWinning(address addr) public view returns (address winnerAddress, string memory name, uint8 guessVal, uint guessedAt) {
        winner memory winr = winners[addr];
        if (winr.winnerAddress != address(0)) {
            winnerAddress = winr.winnerAddress;
            name = winr.name;
            guessVal = winr.guess;
            guessedAt = winr.guessedAt;
        }
    }
}
