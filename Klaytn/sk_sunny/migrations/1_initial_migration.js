const fs = require("fs");
const SKNFT2 = artifacts.require("SKNFT2.sol"); // MyNFTs.sol 파일 추가

module.exports = function (deployer) {
  deployer.deploy(SKNFT2); // MyNFTs를 배포에 추가
};
