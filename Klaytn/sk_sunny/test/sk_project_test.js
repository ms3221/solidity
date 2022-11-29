const Caver = require("caver-js");
const caver = new Caver("HTTP://127.0.0.1:7545");
const SKNFT2 = artifacts.require("SKNFT2");
// 명령어 truffle test ./test/sendTest.js --network gan
contract("SKNFT2", function (accounts) {
  before(async () => {
    //SKContract = await SKNFT2.deployed();
    SKContract = await SKNFT2.new();
  });
  let walletA = accounts[0];
  let walletB = accounts[1];
  let walletC = accounts[2];

  describe("TestCase1 : nmae / symbol 잘나오는지 확인", () => {
    it("name is SKUNK2", async () => {
      const name = await SKContract.name();
      assert.equal(name, "SKUNK2");
    });
    it("symbol is SK2", async () => {
      const symbol = await SKContract.symbol();
      assert.equal(symbol, "SK2");
    });
  });

  describe("TestCase2 : addUserFn / mintNFTFn", () => {
    it("function mintNFT error발생 / whiteList 이유", async () => {
      let f = () => {};
      try {
        await SKContract.mintNFT(walletB, 1, "1");
      } catch (e) {
        f = () => {
          throw e;
        };
      } finally {
        assert.throws(f);
      }
    });

    it("function addWhiteList / walletB is true", async () => {
      await SKContract.addWhiteList([walletB], [2]);
      const memberInfo = await SKContract.verifyUser(walletB);
      assert.equal(memberInfo["whitelisted"], true);
    });

    it(" wallet A is not whiteListed / walletA is false", async () => {
      const memberInfo = await SKContract.verifyUser(walletA);
      assert.equal(memberInfo["whitelisted"], false);
    });

    it("walletB에게 tokenId1 NFT 발행 성공 / owner, balance 비교", async () => {
      await SKContract.mintNFT(walletB, 1, "1");
      const bal = await SKContract.balanceOf(walletB);
      const owner = await SKContract.ownerOf(1);
      assert.equal(bal, 1);
      assert.equal(owner, walletB);
    });
  });

  describe("TestCase3. badge개수에 따른 NFT 차등 발행 test", () => {
    before(async () => {
      await SKContract.updateBadge(walletB, 5);
      await SKContract.mintNFT(walletB, 2, "2");
    });
    it("badge 5개 일때 NFT는 총2개만 소유가능 3개째 mint하면 error가 발생", async () => {
      let f = () => {};
      try {
        await SKContract.mintNFT(walletB, 3, "3");
      } catch (e) {
        f = () => {
          throw e;
        };
      } finally {
        assert.throws(f);
      }
    });
    it("badge 개수를 수정하는 modifiyMemberBadge함수사용해서 badge개수를 6으로변경 3번째 NFT발행 ", async () => {
      await SKContract.updateBadge(walletB, 6);
      await SKContract.mintNFT(walletB, 3, "3");
      const owner = await SKContract.ownerOf(3);
      const bal = await SKContract.balanceOf(walletB);
      assert.equal(bal, 3);
      assert.equal(owner, walletB);
    });
  });
  describe("TestCase4. transferFrom / handleTransferFrom 확인", () => {
    before(async () => {
      await SKContract.approve(SKContract.address, 2, { from: walletB });
    });
    it("handleTransferFrom 함수 실행 전 error가 발생해야 정상", async () => {
      let f = () => {};
      try {
        await SKContract.transferFrom(walletB, walletA, 2, { from: walletB });
      } catch (e) {
        f = () => {
          throw e;
        };
      } finally {
        assert.throws(f);
      }
    });
    it("handleTransferFrom 함수를 실행하고 나면 TransferFrom 함수가 정상적으로 작동하게 된다. ", async () => {
      await SKContract.handleTransferFrom();
      await SKContract.transferFrom(walletB, walletA, 2, { from: walletB });
      const owner = await SKContract.ownerOf(2);
      assert.equal(owner, walletA);
    });
  });
});
