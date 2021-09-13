var MultiNumberBettingV2 = artifacts.require("./MultiNumberBettingV2.sol");

module.exports = function(deployer) {
  deployer.deploy(MultiNumberBettingV2, 10, 20, 30);
};