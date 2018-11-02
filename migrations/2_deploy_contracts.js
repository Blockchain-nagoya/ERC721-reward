let Contracts = artifacts.require("./reward.sol");

module.exports = function(deployer) {
  let name = "TestToken";
  let symbol = "TST";
  deployer.deploy(Contracts, name, symbol);
};
