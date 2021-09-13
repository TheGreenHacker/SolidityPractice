const MultiNumberBettingV3 = artifacts.require("MultiNumberBettingV3");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("MultiNumberBettingV3", function (/* accounts */) {
  it("should assert true", function() {
    var multiNumberBettingV3;
    return MultiNumberBettingV3.deployed().then(function(instance){
      multiNumberBettingV3 = instance;
      multiNumberBettingV3.guess(4, "Jack");
      multiNumberBettingV3.guess(5, "Jack");
      multiNumberBettingV3.guess(4, "Jack");
      multiNumberBettingV3.guess(4, "Jack");
      multiNumberBettingV3.guess(4, "Jack");
      multiNumberBettingV3.guess(4, "Jack");
      multiNumberBettingV3.guess(4, "Jack");
      multiNumberBettingV3.guess(4, "Jack");
      multiNumberBettingV3.guess(4, "Jack");
      multiNumberBettingV3.guess(4, "Jack");
      multiNumberBettingV3.guess(4, "Jack");
      multiNumberBettingV3.guess(4, "Jack");
      multiNumberBettingV3.guess(4, "Jack");
      multiNumberBettingV3.guess(4, "Jack");
      multiNumberBettingV3.guess(4, "Jack");
      multiNumberBettingV3.guess(4, "Jack");
      return multiNumberBettingV3.daysSinceLastWinning.call();
    }).then(function (result) {
      console.log("Number of days since last winning is ", Number(result));
      assert.equal(Number(result), 0, "Number of days since last winning NOT equal to 0!!!");
      multiNumberBettingV3.guess(4, "Jack");
      multiNumberBettingV3.guess(5, "Jack");
      multiNumberBettingV3.guess(4, "Jack");
      multiNumberBettingV3.guess(4, "Jack");
      multiNumberBettingV3.guess(4, "Jack");
      multiNumberBettingV3.guess(4, "Jack");
      multiNumberBettingV3.guess(4, "Jack");
      multiNumberBettingV3.guess(4, "Jack");
      multiNumberBettingV3.guess(4, "Jack");
      multiNumberBettingV3.guess(4, "Jack");
      multiNumberBettingV3.guess(4, "Jack");
      multiNumberBettingV3.guess(4, "Jack");
      multiNumberBettingV3.guess(4, "Jack");
      multiNumberBettingV3.guess(4, "Jack");
      multiNumberBettingV3.guess(4, "Jack");
      multiNumberBettingV3.guess(4, "Jack");
      return multiNumberBettingV3.hoursSinceLastWinning.call();
    }).then(function (result) {
      console.log("Number of hours since last winning is ", Number(result));
      assert.equal(Number(result), 0, "Number of hours since last winning NOT equal to 0!!!");
      return multiNumberBettingV3.dayToSeconds.call();
    }).then(function (result) {
      console.log("Number of seconds in a day is ", Number(result));
      // assert.equal(Number(result), 0, "Number of hours since last winning NOT equal to 0!!!");
    });
  });
});
