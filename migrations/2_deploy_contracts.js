const Contract = artifacts.require("./Membership.sol");

module.exports = function(deployer) {
  const link = "https://membership.blockchain-nagoya.com/";
  deployer.deploy(Contract, link);
};
