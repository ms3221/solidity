const VoteContractFactory= artifacts.require("VoteContractFactory");

module.exports = function (deployer) {
  deployer.deploy(VoteContractFactory);
};
