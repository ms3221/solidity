

const Caver = require('caver-js')
const caver = new Caver('https://api.baobab.klaytn.net:8651')
const UnionFactory = artifacts.require("UnionFactory");
const Union = artifacts.require("Union")
const UnionToken = artifacts.require("UnionToken");
//const test = artifacts.require("Votes")




contract("UnionFactory", function (accounts) {

    let unionFactory;
	let union;
    let token;
    let wallet1 = accounts[0]
    let wallet1PK = process.env.WALLET1
    let wallet2 = accounts[1];
    let wallet2PK = process.env.WALLET2
   
    
    
    before( async () => {

        // unionFactory = await UnionFactory.deployed();
        // await unionFactory.createUnion("마켓컬리1호",wallet1,{from:wallet1});
        // const unionAddress = await unionFactory.UnionAddress("마켓컬리1호");
        // const tokenAddress = await unionFactory.UnionTokenAddress("마켓컬리1호");
		// union = await Union.at(unionAddress);
        // token = await UnionToken.at(tokenAddress)
        // await token.mintToken(wallet2,1000000);
        caver.klay.accounts.wallet.add(wallet1PK, wallet1);
         caver.klay.accounts.wallet.add(wallet2PK, wallet2);
       
    });
     

//     describe("TestCase1 : UnionFactory Contract 생성 및 union과 token생성 ",() => {
//         it('1. totalUnionNumber is a one', async () => {
           
// 			const totalNum = await unionFactory.totalUnionNumber();
//             assert.equal(totalNum, 1);
//         });

// 		it('2. unions[0] same as unionAddress function return value', async () => {
//             const unionAddress = await unionFactory.UnionAddress("마켓컬리1호");
// 			const unionsArrayValue = await unionFactory.unions(0);
//             assert.equal(unionAddress, unionsArrayValue);
//         });

//         it('3. unionToken name is 마켓컬리1호', async () => {
          
// 		    const tokenName = await token.name();
//             assert.equal(tokenName, "마켓컬리1호");
//         });
      
//         it('4. wallet2 token totalNumber is two', async () => {
          
// 		    const supply = await token.balanceOf(wallet2);
            
//             assert.equal(supply.toNumber(),1000000);
//         });

//         it('5.getBalance function is alright? ', async () => {
//             const supply = await union.getBalanceVotePower(wallet2);
            
//             assert.equal(supply.toNumber(), 1000000);
//        });
   
//   });

      describe("TestCase2 : Union Contract 생성 및 다양한 함수 test",() => {
	    // it('1. createOneSuggestion function execute', async () => {
	   
	  	//      await union.createOneSuggestion("1호제안",{from:wallet1});
		// 	 const suggestion = await union.suggestions(0);
	    //  	 assert.equal(suggestion.subject, "1호제안");
	    //    });

		it('2. wallet2 execute vote function', async () => {
console.log(wallet2);
            const { rawTransaction: senderRawTransaction } = await caver.klay.accounts.signTransaction({
                type: 'FEE_DELEGATED_VALUE_TRANSFER',
                from: wallet1,
                to: wallet2,    
                gas: '300000',
                value: caver.utils.toPeb('1', 'KLAY'),
              }, wallet1PK);
          
           const result = await caver.klay.sendTransaction({
                senderRawTransaction: senderRawTransaction,
                feePayer: wallet2,
              })

              console.log(result);
		//    await union.vote("1호제안","찬성",1,{from : wallet2});
		//    const result = await union.SuggestionVoter("1호제안");
		//    assert.equal(result[0].addr, wallet2);
		});

        //  it('3. wallet3 execute vote function ', async () => {
        //       await union.vote("1호제안","찬성",100,{from : wallet3});
        //       const result = await union.SuggestionVoter("1호제안");
        //       assert.equal(result[1].addr, wallet3);
        //  });

//          it('4.getBalance function is alright? ', async () => {
//             const supply = await union.getBalanceVotePower(wallet2);
           
//             assert.equal(supply.toNumber(), 999999);
//        });

//        it('5. createOneSuggestion function execute', async () => {
	   
//         await union.createOneSuggestion("2호제안");
//         const suggestion = await union.suggestions(1);
//        assert.equal(suggestion.subject, "2호제안");
//     });

//     it('6. wallet2 execute vote function', async () => {
//         await union.vote("2호제안","찬성",99,{from : wallet2});
//         const result = await union.SuggestionVoter("2호제안");
//         assert.equal(result[0].addr, wallet2);
//      });
//      it('7.getBalance function is alright? ', async () => {
//         const supply = await union.getBalanceVotePower(wallet2);
//         console.log(supply.toNumber());
//         assert.equal(supply.toNumber(), 999900);
//    });

   });

});
