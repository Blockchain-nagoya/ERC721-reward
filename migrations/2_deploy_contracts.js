let Contracts = artifacts.require("./reward.sol");

module.exports = function(deployer) {
  deployer.deploy(Contracts);
};
