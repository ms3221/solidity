const { expect } = require("chai");
const { ethers } = require("hardhat");
const Web3 = require("web3");
const web3 = new Web3("HTTP://127.0.0.1:8545");
//const { waffle } = require("hardhat");

describe("WATTONFT", function () {
  let contract;
  before(async function () {
    //this.Contract = await ethers.getContractFactory("WATTONFT");
    const WATTONFT = await ethers.getContractFactory("WATTONFT");
    contract = await WATTONFT.deploy();
    await contract.deployed();
  });

  // beforeEach(async function () {
  //   this.contract = await this.Contract.deploy();
  //   await this.contract.deployed();
  // });
  describe("TestCase1 : 정상적으로 구동되니?", () => {
    it("ERC721 정상작동", async () => {
      await contract.mintNFT("hello");
      const tx = await contract.safeTransferFrom(
        "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266",
        "0xB2a1Ec15012f76D21572539397383097B5acfcdA",
        1
      );
      console.log(tx);
    });
  });
});
