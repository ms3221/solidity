const Caver = require("caver-js");
const caver = new Caver("HTTP://127.0.0.1:7545");
const SKNFT2 = artifacts.require("SKNFT2");
// 명령어 truffle test ./test/sendTest.js --network gan
contract("SKNFT", function (accounts) {
  let walletA = accounts[0];
  let walletB = accounts[1];

  before(async () => {
    SKContract = await SKNFT2.deployed();
    console.log("SKContract", SKContract.address);
  });

  describe("TestCase1 : nmae / symbol", () => {
    it("name is SKUNK", async () => {
      const name = await SKContract.name();
      assert.equal(name, "SKUNK");
    });
    it("symbol is SK", async () => {
      const symbol = await SKContract.symbol();
      assert.equal(symbol, "SK");
    });
  });

  describe("TestCase2 : addUserFn / mintNFTFn", () => {
    it("function mintNFT error발생 addUser 전", async () => {
      let f = () => {};
      try {
        await SKContract.mintNFT(1, walletA, 2, "http");
      } catch (e) {
        f = () => {
          throw e;
        };
      } finally {
        assert.throws(f);
      }
    });
    it("symbol is SK", async () => {
      const symbol = await SKContract.symbol();
      assert.equal(symbol, "SK");
    });
  });
});
