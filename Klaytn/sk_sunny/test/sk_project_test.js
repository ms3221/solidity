const Caver = require("caver-js");
const caver = new Caver("HTTP://127.0.0.1:7545");
const SKNFT2 = artifacts.require("SKNFT2");
// 명령어 truffle test ./test/sendTest.js --network gan
contract("SKNFT", function (accounts) {
  let walletA = accounts[0];
  let walletB = accounts[1];

  before(async () => {
    SKContract = await SKNFT2.deployed();
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
    it("function mintNFT error발생 / whlist추가를 하지않아서", async () => {
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
    it("function mintNFT 정상실행 / tokenId 1의 주인이 walletA가 되면된다", async () => {
      await SKContract.addUser([walletA]);
      await SKContract.mintNFT(2, walletA, 1, "http://tokendId/1");
      const owner = await SKContract.ownerOf(1);
      assert.equal(owner, walletA);
    });

    it("function mintNFT tokenId 중복 error확인", async () => {
      try {
        await SKContract.addUser([walletA]);
        await SKContract.mintNFT(2, walletA, 1, "http://tokendId/1");
        await SKContract.mintNFT(2, walletA, 1, "http://tokendId/1");
      } catch (e) {
        f = () => {
          throw e;
        };
      } finally {
        assert.throws(f);
      }
    });
  });

  describe("TestCase3 : badge조건, 권한에다른 커스터마이징 조건", () => {
    it("badge가 4개가지고있는 유저가 NFT를 2개까지 소유하고있으면 3개를 mint하려고할때 오류가 발생 ", async () => {
      // badge 4개면 nft총량은 2개
      // badge 3개면 nft총량은 1개
      console.log(await SKContract.balanceOf(walletA).toString());
      await SKContract.mintNFT(4, walletA, 2, "http://tokendId/1");
    });
  });
});
