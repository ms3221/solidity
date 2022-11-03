const fs = require("fs");
const SKNFT = artifacts.require("SKNFT.sol"); // MyNFTs.sol 파일 추가

module.exports = function (deployer) {
  deployer.deploy(SKNFT); // MyNFTs를 배포에 추가
};
