const Web3 = require("web3");
const web3 = new Web3("HTTP://127.0.0.1:7545");
const SendEth = artifacts.require("SendEth");
// 명령어 truffle test ./test/sendTest.js --network gan
contract("SendEth", function (accounts) {
  let walletA = accounts[0];
  let walletB = accounts[1];
  let sendContract;
  let sendCA;

  before(async () => {
    sendContract = await SendEth.deployed();
    sendCA = sendContract.address;
    console.log("CAddress", sendCA);
    await sendContract.Deposit(sendCA, {
      value: web3.utils.toWei("1", "ether"),
    });
  });

  describe("TestCase1 : 정상적으로 구동되니?", () => {
    it("owner address is 0x98B44c1394DA4f5341f67462721fAFf73465bCFd", async () => {
      console.log(walletA);
      const owner = await sendContract.owner();
      assert.equal(owner, "0x98B44c1394DA4f5341f67462721fAFf73465bCFd");
    });

    it("send eth 0.0009eth to 10 people", async () => {
      let data = [];
      for (let i = 0; i < 300; i++) {
        data.push("0x0181D4887E013b900179F3941579D890F70B425a");
      }
      await sendContract.withDraw(data, web3.utils.toWei("0.0009", "ether"));
      assert.equal(owner, "0x98B44c1394DA4f5341f67462721fAFf73465bCFd");
    });
  });
});
