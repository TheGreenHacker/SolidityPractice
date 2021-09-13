const MultiNumberBettingV1 = artifacts.require("MultiNumberBettingV1");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("MultiNumberBettingV1", function (/* accounts */) {
  it("should assert true", function() {
    var multiNumberBettingV1;
    return MultiNumberBettingV1.deployed().then(function(instance){
      multiNumberBettingV1 = instance;
      return multiNumberBettingV1.totalGuesses.call();
    }).then(function (result) {
      assert.equal(result.valueOf(), 0, "Contract initialized with total number of guesses NOT equal to 0!!!");
      multiNumberBettingV1.guess(15);
      multiNumberBettingV1.guess(20);
      return multiNumberBettingV1.totalGuesses.call();
    }).then(function (result) {
      assert.equal(result.valueOf(), 2, "Total number of guesses NOT equal to 2!!!");
    });
  });
});
