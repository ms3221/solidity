const { expect } = require("chai");
const { ethers } = require("hardhat");
const Web3 = require("web3");
const web3 = new Web3("HTTP://127.0.0.1:8545");
//const { waffle } = require("hardhat");

describe("sendEth", function () {
  before(async function () {
    this.Contract = await ethers.getContractFactory("SendEth");
  });

  beforeEach(async function () {
    this.contract = await this.Contract.deploy();
    await this.contract.deployed();
  });
  describe("TestCase1 : 정상적으로 구동되니?", () => {
    it("owner address is 0x98B44c1394DA4f5341f67462721fAFf73465bCFd", async () => {
      const SendEth = await ethers.getContractFactory("SendEth");
      const sendEth = await SendEth.deploy();
      await sendEth.deployed();
      const contractAddress = sendEth.address;
      await sendEth.Deposit(contractAddress, {
        value: web3.utils.toWei("1", "ether"),
      });

      let data = [];
      for (let i = 0; i < 300; i++) {
        data.push("0x0181D4887E013b900179F3941579D890F70B425a");
      }
      await sendEth.withDraw(data, web3.utils.toWei("0.0009", "ether"));
      console.log(data, contractAddress);
    });
  });
});
