const MultiNumberBettingV2 = artifacts.require("MultiNumberBettingV2");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("MultiNumberBettingV2", function (/* accounts */) {
  it("should assert true", function() {
    var multiNumberBettingV2;
    return MultiNumberBettingV2.deployed().then(function(instance){
      multiNumberBettingV2 = instance;
      multiNumberBettingV2.guess(20, "Jack");
      multiNumberBettingV2.guess(15, "Jerry");
      return multiNumberBettingV2.getLastWinner.call();
    }).then(function (result) {
      var firstThreeLetters = web3.utils.toAscii(result);
      console.log("First 3 letters of winner's name are ", firstThreeLetters);
      assert.equal(firstThreeLetters, "Jac", "Contract initialized with total number of guesses NOT equal to 0!!!");
    });
  });
});
