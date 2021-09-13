pragma solidity >=0.4.22 <0.9.0;

contract MultiNumberBettingV4 {
    // Winner
    struct winner {
        address winnerAddress;
        string name;
        uint8 guess;
        uint guessedAt;
    }

    uint loserCount;
    uint winnerCount;
    uint lastWinnerAt;  // time of last winning
    uint8[] arr;  // array of numbers to be guessed (0 to 10)
    address lastWinnerAddress;  
    mapping(address => winner) winners;  // mapping to keep track of winners' info

    constructor(uint8 x, uint8 y, uint8 z) public {
        arr = [x, y, z];
    }

    /* Lets user guess a number in the array (0-10) */
    function guess(uint8 x, string memory name) public returns (bool) {
        assert(x <= 10);
        for (uint i=0; i < arr.length; i++) {
            if (arr[i] == x) {
                winnerCount++;
                lastWinnerAddress = tx.origin;
                lastWinnerAt = now;
                winners[lastWinnerAddress] = winner(lastWinnerAddress, name, x, now);
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

    function getLastWinnerInfo() public view returns (address winnerAddress, string memory name, uint8 guessVal, uint timeGuessed) {
        winner memory lastWinner = winners[lastWinnerAddress];
        winnerAddress = lastWinner.winnerAddress;
        name = lastWinner.name;
        guessVal = lastWinner.guess;
        timeGuessed = lastWinner.guessedAt;
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
