pragma solidity >=0.4.22 <0.9.0;

contract MultiNumberBettingV3 {
    uint loserCount;
    uint winnerCount;
    uint lastWinnerAt;  // time of last winning
    uint8[] arr;  // array of numbers to be guessed (0 to 10)
    string lastWinnerName;  // name of last winner
    address winner;  // address of last winner

    constructor(uint8 x, uint8 y, uint8 z) public {
        arr = [x, y, z];
    }

    /* Lets user guess a number in the array (0-10) */
    function guess(uint8 x, string memory name) public returns (bool) {
        assert(x <= 10);
        for (uint i=0; i < arr.length; i++) {
            if (arr[i] == x) {
                winnerCount++;
                lastWinnerName = name;
                lastWinnerAt = now;
                winner = tx.origin;
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

    function dayToSeconds() public pure returns (uint) {
        return 1 hours;
    }

    /* Returns the first 3 letters of the last winner's name. */
    function getLastWinner() public view returns (bytes memory) {
        bytes memory lastWinnerNameBytes = bytes(lastWinnerName);
        if (lastWinnerNameBytes.length != 0) {
            uint end = lastWinnerNameBytes.length <= 3? lastWinnerNameBytes.length : 3;
            bytes memory firstThreeBytes = new bytes(end);
            for (uint i = 0; i < end; i++) {
                firstThreeBytes[i] = lastWinnerNameBytes[i];
            }
            return firstThreeBytes;
        }
        else {
            return bytes("***");
        }
    }
}
