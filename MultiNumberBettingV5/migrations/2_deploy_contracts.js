var MultiNumberBettingV5 = artifacts.require("./MultiNumberBettingV5.sol");

module.exports = function(deployer) {
  deployer.deploy(MultiNumberBettingV5, 3, 5, 9);
};