var MultiNumberBettingV6 = artifacts.require("./MultiNumberBettingV6.sol");

module.exports = function(deployer) {
  deployer.deploy(MultiNumberBettingV6, 1, 3, 9);
};