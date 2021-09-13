pragma solidity >=0.4.22 <0.9.0;

contract MultiNumberBettingV1 {
    uint loserCount;
    uint winnerCount;
    uint8[] arr;

    constructor(uint8 x, uint8 y, uint8 z) public {
        arr = [x, y, z];
    }

    function guess(uint8 x) public returns (bool) {
        uint i;
        for (i=0; i < arr.length; i++) {
            if (arr[i] == x) {
                winnerCount++;
                return true;
            }
        }

        loserCount++;
        return false;
    } 

    function totalGuesses() public view returns (uint) {
        return loserCount + winnerCount;
    }
}
