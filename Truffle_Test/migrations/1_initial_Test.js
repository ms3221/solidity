const fs = require("fs");
const Test = artifacts.require("Test.sol"); // MyNFTs.sol 파일 추가

module.exports = function (deployer) {
  deployer.deploy(Test); // MyNFTs를 배포에 추가
};
