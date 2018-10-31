let Contract = artifacts.require("./reward.sol");

module.exports = function(deployer) {
  deployer.deploy(Contract);
};
