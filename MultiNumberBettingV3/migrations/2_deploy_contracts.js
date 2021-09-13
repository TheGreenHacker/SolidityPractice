var MultiNumberBettingV3 = artifacts.require("./MultiNumberBettingV3.sol");

module.exports = function(deployer) {
  deployer.deploy(MultiNumberBettingV3, 5, 8, 9);
};