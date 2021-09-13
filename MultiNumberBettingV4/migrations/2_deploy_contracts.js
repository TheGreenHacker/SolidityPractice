var MultiNumberBettingV4 = artifacts.require("./MultiNumberBettingV4.sol");

module.exports = function(deployer) {
  deployer.deploy(MultiNumberBettingV4, 3, 8, 9);
};