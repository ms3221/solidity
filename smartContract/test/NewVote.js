const  Web3  = require("web3");
const web3 = new Web3("HTTP://127.0.0.1:7545");
const Tx = require('ethereumjs-tx').Transaction
const VoteFactory = artifacts.require("VoteContractFactory");
const test = artifacts.require("Votes")




contract("VoteContractFactory", function (accounts) {

    let voteFactory;
    let wallet1 = accounts[0]
    let wallet2 = accounts[1];
    let wallet3 = accounts[2];
    let wallet4 = accounts[3];
    let wallet5 = accounts[4];
    let wallet6 = accounts[5];
    let tests;
    let proposalIndex;
    let firstProposal;
    
    
    before( async () => {
        voteFactory = await VoteFactory.deployed();
        //tokenId value 1
       console.log(await web3.utils.utf8ToHex("컬리해산 조합 1호"));
        const tx = await voteFactory.voteFactory(
            web3.utils.utf8ToHex("컬리해산 조합 1호"),{from:wallet1}
        );
        firstProposal = await voteFactory.votes(0);
        tests = await test.at(firstProposal);
       
			
    });
     

    describe("TestCase1 : VoteFactory SmartContract 생성 및  Test",() => {
        it('1. 첫 번째 proposal이 해산안 이름이 일치하는가?', async () => {
           
            const result = await voteFactory.subVoteUnionId(firstProposal);
            const[chairperson,unionId,Voters,open] = result;
           
                assert.equal(("컬리해산 조합 1호"), web3.utils.hexToUtf8(unionId));
        });
        it('2. wallet2가 firstProposal에 투표가 제대로 되는지 / 중복투표는 막아지는지', async () => {


           await tests.vote("찬성",{from:wallet2,value:web3.utils.toWei("1","ether")});
           const result = await tests.totalProposal();
           const[chairperson,unionId,Voters,open] = result;
            
           assert.equal(Voters[0].addr,wallet2);
         
            // const contract = new web3.eth.Contract(abi,firstProposal,{from:wallet1});
            // const nonce = await web3.eth.getTransactionCount(wallet2); //get latest nonce
            // const tx = {
            //   "from": wallet2,
            //   'to': firstProposal,
            //   'nonce': nonce  ,
            //   'gas': 500000,
            //   'data': contract.methods.vote("찬성").encodeABI()
            // };
          
            
            // const sign= await web3.eth.signTransaction(tx, "219bdeeb468983f8ee28ebc3ec2d286f572413881a37bf75645fcd7a2f2ab406");
            // console.log(sign);
            
            // const privateKey = Buffer.from(
            //   '219bdeeb468983f8ee28ebc3ec2d286f572413881a37bf75645fcd7a2f2ab406',
            //   'hex',
            // )
            
            // const txParams = {
            //   nonce: web3.eth.getTransactionCount(wallet2),
            //   gasPrice: '0x09184e72a000',
            //   gasLimit: '0x2710',
            //   to: wallet2,
            //   value: web3.utils.toHex( web3.utils.toWei("1", 'ether') ),
            //   data: contract.methods.vote("찬성").encodeABI(),
            // }
            
            // // The second parameter is not necessary if these values are used
            // const tx = new Tx(txParams, { chain: 'ganache' })
            // tx.sign(privateKey)
            // console.log(tx);
            // const serializedTx = tx.serialize()
            //console.log(await contract.methods.totalProposal().call());
          //  const result = await vo.totalProposal();
            // console.log(vote);
           // const answer = "찬성";
           // const tx = await vote.vote(11,{from:wallet2, value:web3.utils.toWei("1","ether")});
            
           
            // console.log(result);
            // const[chairperson,unionId,Voters,open] = result;
            //  console.log(Voters);
            
        });
        // it('3. wallet3 계정이 투표를 제대로 진행됬는지 확인 / totoal 2 ', async () => {
        //     const tx = await vote.vote(0,"찬성",
        //     {
        //         from:wallet3, value:web3.utils.toWei("1","ether")
        //     });
            
        //     const result = await vote.totalVoteOutput(0);
        //       const[unionId,addr,asset,voted,answer] = result[0];
        //       assert.equal(result.length, 2);
        // });
        
        // it('4. wallet1 계정이 투표가 안되는지 확인(안되는 것이 정상) error 발생 ', async () => {
        //     const tx = await vote.vote(0,"찬성",
        //     {
        //         from:wallet1, value:web3.utils.toWei("1","ether")
        //     });
            
        //     const result = await vote.totalVoteOutput(0);
        //       const[unionId,addr,asset,voted,answer] = result[0];
            

        //       assert.equal(result.length, 1);
        // });
        // it('5. wallet2 계정이 재투표가 안되는지 확인(안되는 것이 정상) error 발생 ', async () => {
        //     const tx = await vote.vote(0,"찬성",
        //     {
        //         from:wallet2, value:web3.utils.toWei("1","ether")
        //     });
            
        //     const result = await vote.totalVoteOutput(0);
        //       assert.equal(result.length, 1);
        // });
        
    
    })

   
});


var abi = [
	{
		"inputs": [
			{
				"internalType": "bytes32",
				"name": "unionId",
				"type": "bytes32"
			}
		],
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"internalType": "bytes32",
				"name": "unionId",
				"type": "bytes32"
			},
			{
				"indexed": true,
				"internalType": "address",
				"name": "chairperson",
				"type": "address"
			}
		],
		"name": "showProposal",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"internalType": "address",
				"name": "voter",
				"type": "address"
			},
			{
				"indexed": false,
				"internalType": "string",
				"name": "answer",
				"type": "string"
			}
		],
		"name": "voteReceipt",
		"type": "event"
	},
	{
		"inputs": [],
		"name": "chairperson",
		"outputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "proposal",
		"outputs": [
			{
				"internalType": "address",
				"name": "chairperson",
				"type": "address"
			},
			{
				"internalType": "bytes32",
				"name": "UnionId",
				"type": "bytes32"
			},
			{
				"internalType": "bool",
				"name": "open",
				"type": "bool"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "proposalLen",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "totalProposal",
		"outputs": [
			{
				"components": [
					{
						"internalType": "address",
						"name": "chairperson",
						"type": "address"
					},
					{
						"internalType": "bytes32",
						"name": "UnionId",
						"type": "bytes32"
					},
					{
						"components": [
							{
								"internalType": "bytes32",
								"name": "unionId",
								"type": "bytes32"
							},
							{
								"internalType": "address",
								"name": "addr",
								"type": "address"
							},
							{
								"internalType": "uint256",
								"name": "asset",
								"type": "uint256"
							},
							{
								"internalType": "bool",
								"name": "voted",
								"type": "bool"
							},
							{
								"internalType": "string",
								"name": "answer",
								"type": "string"
							}
						],
						"internalType": "struct Votes.Voter[]",
						"name": "Voters",
						"type": "tuple[]"
					},
					{
						"internalType": "bool",
						"name": "open",
						"type": "bool"
					}
				],
				"internalType": "struct Votes.Proposal",
				"name": "",
				"type": "tuple"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "totalVoteOutput",
		"outputs": [
			{
				"components": [
					{
						"internalType": "bytes32",
						"name": "unionId",
						"type": "bytes32"
					},
					{
						"internalType": "address",
						"name": "addr",
						"type": "address"
					},
					{
						"internalType": "uint256",
						"name": "asset",
						"type": "uint256"
					},
					{
						"internalType": "bool",
						"name": "voted",
						"type": "bool"
					},
					{
						"internalType": "string",
						"name": "answer",
						"type": "string"
					}
				],
				"internalType": "struct Votes.Voter[]",
				"name": "",
				"type": "tuple[]"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "answer",
				"type": "string"
			}
		],
		"name": "vote",
		"outputs": [],
		"stateMutability": "payable",
		"type": "function"
	}
];