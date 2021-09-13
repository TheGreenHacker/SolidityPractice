var MultiNumberBettingV1 = artifacts.require("./MultiNumberBettingV1.sol");

module.exports = function(deployer) {
  deployer.deploy(MultiNumberBettingV1, 10, 20, 30);
};