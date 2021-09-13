var MultiNumberBettingV7 = artifacts.require("./MultiNumberBettingV7.sol");

module.exports = function(deployer) {
  deployer.deploy(MultiNumberBettingV7, 1, 3, 9);
};