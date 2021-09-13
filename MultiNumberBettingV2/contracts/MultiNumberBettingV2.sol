pragma solidity >=0.4.22 <0.9.0;

contract MultiNumberBettingV2 {
    uint loserCount;
    uint winnerCount;
    uint8[] arr;
    string lastWinnerName;

    constructor(uint8 x, uint8 y, uint8 z) public {
        arr = [x, y, z];
    }

    function guess(uint8 x, string memory name) public returns (bool) {
        for (uint i=0; i < arr.length; i++) {
            if (arr[i] == x) {
                winnerCount++;
                lastWinnerName = name;
                return true;
            }
        }

        loserCount++;
        return false;
    } 

    function totalGuesses() public view returns (uint) {
        return loserCount + winnerCount;
    }

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
