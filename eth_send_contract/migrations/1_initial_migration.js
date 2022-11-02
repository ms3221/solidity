const Migrations = artifacts.require("Migrations");
const SendEth = artifacts.require("SendEth");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
};

module.exports = function (deployer) {
  deployer.deploy(SendEth);
};
