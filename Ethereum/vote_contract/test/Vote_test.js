const  Web3  = require("web3");
const web3 = new Web3("HTTP://127.0.0.1:7545");

const Vote = artifacts.require("Vote");


const provider = new ethers.providers.JsonRpcProvider(providerUrl)


contract("Vote", function (accounts) {

    let vote;
    let wallet1 = accounts[0]
    let wallet2 = accounts[1];
    let wallet3 = accounts[2];
    let wallet4 = accounts[3];
    let wallet5 = accounts[4];
    let wallet6 = accounts[5];
    let voteCA;
    let proposalIndex;
    
    
    before( async () => {
        vote = await Vote.deployed();
        //tokenId value 1
      
    });
     

    describe("TestCase1 : Vote SmartContract 생성 및  Test",() => {
        it('1. 첫 번째 proposal이 생성이 됬다면 proposalLen값은 1이 되어야 한다.', async () => {
            const tx = await vote.createProposal(
            web3.utils.asciiToHex("컬리해산 조합 1호"),{from:wallet1}
            );
               // console.log(tx.logs[0].args[0].toNumber());
                const index = await vote.proposalLen();
                assert.equal(index, 1);
        });
        it('2. wallet2 계정이 투표를 제대로 진행됬는지 확인 ', async () => {
            const tx = await vote.vote(0,"찬성",
            {
                from:wallet2, value:web3.utils.toWei("1","ether")
            });
            
            const result = await vote.totalVoteOutput(0);
              const[unionId,addr,asset,voted,answer] = result[0];
              assert.equal(result.length, 1);
        });
        it('3. wallet3 계정이 투표를 제대로 진행됬는지 확인 / totoal 2 ', async () => {
            const tx = await vote.vote(0,"찬성",
            {
                from:wallet3, value:web3.utils.toWei("1","ether")
            });
            
            const result = await vote.totalVoteOutput(0);
              const[unionId,addr,asset,voted,answer] = result[0];
              assert.equal(result.length, 2);
        });
        
        it('4. wallet1 계정이 투표가 안되는지 확인(안되는 것이 정상) error 발생 ', async () => {
            const tx = await vote.vote(0,"찬성",
            {
                from:wallet1, value:web3.utils.toWei("1","ether")
            });
            
            const result = await vote.totalVoteOutput(0);
              const[unionId,addr,asset,voted,answer] = result[0];
            

              assert.equal(result.length, 1);
        });
        it('5. wallet2 계정이 재투표가 안되는지 확인(안되는 것이 정상) error 발생 ', async () => {
            const tx = await vote.vote(0,"찬성",
            {
                from:wallet2, value:web3.utils.toWei("1","ether")
            });
            
            const result = await vote.totalVoteOutput(0);
              assert.equal(result.length, 1);
        });
        
    
    })

   
});