pragma solidity >=0.4.22 <0.9.0;

contract MultiNumberBettingAbstractV3 {
    uint constant MAX_BET = 5 ether;
    uint constant MIN_BET = 1 ether;

    function guess(uint8 x, string memory name) public payable returns (bool);
    function getLoserCount() public view returns (uint);
    function getWinnerCount() public view returns (uint);
    function daysSinceLastWinning() public view returns (uint);
    function hoursSinceLastWinning() public view returns (uint);
    function minutesSinceLastWinning() public view returns (uint);
    function getLastWinnerInfo() public view returns (address winnerAddress, string memory name, uint8 guessVal, uint timeGuessed, uint ethersReceived);
    function checkWinning(address addr) public view returns (address winnerAddress, string memory name, uint8 guessVal, uint guessedAt);
}

