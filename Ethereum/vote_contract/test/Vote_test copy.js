const Web3 = require("web3");
const web3 = new Web3("HTTP://127.0.0.1:7545");

const union = artifacts.require("Union");

const provider = new ethers.providers.JsonRpcProvider(providerUrl);

contract("Union", function (accounts) {
  let vote;
  let wallet1 = accounts[0];
  let wallet2 = accounts[1];

  before(async () => {
    vote = await Union.deployed();
  });

  describe("TestCase1 : Union SmartContract 생성 및  Test", () => {
    it("1.union Name이 test와 일치하는지 확인하기.", async () => {
      const name = await vote.name();
      assert.equal(name, "test");
    });
    it("2.owner가 배포한 address와 일치하는지  ", async () => {
      const owner = await union.owners(wallet1);
      // owner는 bool형으로 나오게 되며 owner로 등록이 되어있다면 true 아니라면 false
      assert.equal(owner, true);
    });

    it("3. userListSetting function is right?", async () => {
      // 임의로 배열을 만들어서 test중
      // 원래는 ipfsHash값이 들어가 있어야합니다.
      await union.setUserList(["1", "2", "3", "4"]);
      const suggestionName = await union.suggestions(0);
      const tokenPower = await union.userClaim("1");
      assert.equal(tokenPower, 999);
    });

    it("4. createSuggestion is called 1차 테스트", async () => {
      // ..제안을 생성하는 함수 1차 test라는 내용과 일치하는지 확인하는 test작업
      await union.createSuggestion("1차 test");
      const suggestionName = union.suggestions(0);
      assert.equal(suggestionName, "1차 test");
    });

    it("5. mintNFT function is alright? ", async () => {
      // 필요한 param
      // address user,
      // string memory ipfsKey,
      // string memory tokenURI,
      // uint256 power
      await union.mintNFT(wallet2, "1", `https://${ipfsKey}`, 100);
      const tokenPower = await union.userClaim("1");
      const owner = await union.ownerOf(1);
      const bal = await union.balanceOf(wallet2);

      assert.equal("bal", 1);
      assert.equal("owner", wallet2);
      assert.equal(tokenPower, 100);
    });

    it("6. user is going to vote to suggeionsNo 1 ", async () => {
      // user 투표
      // @param _subject는 새로운 안건이름
      // @param _answer는 투표내용 (ex)찬성, 반대)
      // @param tokenId == power
      // @dev struct구조체 suggestion에 새로운 안건이름을 저장
      await union.vote("1차 test", "찬성", 1, { from: wallet2 });
      const { suggestion, addr, power, tokenId, answer } =
        await vote.suggestions(0);

      assert.equal(suggestion, "1차 test");
      assert.equal(addr, wallet2);
      assert.equal(power, 100);
      assert.equal(tokenId, 1);
      assert.equal(answer, "찬성");
    });
  });
});
