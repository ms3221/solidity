const Web3 = require("web3");
//const rpcURL = "https://eth-goerli.g.alchemy.com/v2/jVomEiZSaJt79dNlKuCnnKH8p9BMNc81";
const rpcURL = "https://eth-mainnet.g.alchemy.com/v2/U4SuB5RfZ7kX8LMEFcUg68fvzDyyD7HP";
const web3 = new Web3(rpcURL);
const namehash = require("eth-ens-namehash");
const { Alchemy } = require('alchemy-sdk');

const apiKey = "U4SuB5RfZ7kX8LMEFcUg68fvzDyyD7HP";
const settings = {
    apiKey: apiKey
};

const alchemy = new Alchemy(settings);

/**
 *  testnet = goerli ENS
 *  resolver : 0xE264d5bb84bA3b8061ADC38D3D76e6674aB91852
 *  _ens : 0x00000000000C2E074eC69A0dFb2997BA6C7d2e1e
 *  rootNoode : 0xfd7f5c28743a891291f9f9971b1e06920f5a26919632c52b05c186bbc4d2fb54(pado.eth nameHash)
 */

/**
 *  mainnet = goerli ENS
 *  resolver : 0x4976fb03c32e5b8cfe2b6ccb31c09ba78ebaba41
 *  _ens : 0x00000000000C2E074eC69A0dFb2997BA6C7d2e1e
 *  rootNoode : 0xfd7f5c28743a891291f9f9971b1e06920f5a26919632c52b05c186bbc4d2fb54(pado.eth nameHash)
 */

const main = async ()=>{
    
const getBlock = async ()=>{
    const blockData = await web3.eth.getBlock('latest');
    console.log(blockData);
}

const ensToAddresss = async ()=>{
    var address = await web3.eth.ens.getAddress('pado.eth');
    console.log(address); 
}

const keccak = async (_label)=>{
      const label = await web3.utils.soliditySha3(_label)
      console.log(label, 'label');
}

const nameHash_node = async (ENS)=>{
  var hash = namehash.hash(ENS);
  console.log(hash,"hash");
}

const hashToString = async ()=>{
    const lable = await web3.utils.hexToUtf8("0xfd7f5c28743a891291f9f9971b1e06920f5a26919632c52b05c186bbc4d2fb54")
    console.log(lable);
}

const reverseNode = async (address)=>{
    if (address.startsWith('0x')) {
        address = address.slice(2)
      }
    const name = `${address.toLowerCase()}.addr.reverse`
    var hash = namehash.hash(name);
    console.log(hash,"hash");
}

const blockSearch = async ()=>{
  //Transfer (index_topic_1 bytes32 node, address owner)View Source
  const data = await web3.eth.getPastLogs({
        fromBlock: 7913008,
        toBlock: 7920138,
        address: "0xd2463972ae1d9a97f3ad8a2b22a6584ebba9afee",
        topics: ["0x970f17cc4e312a681814bcb131a154e9a61fa3317b90bbd0437a58626973b4a0"]
    })
    data.forEach( async (data) => {
        console.log(data.data);
       const decode = await web3.eth.abi.decodeParameters(['string', 'address'],data.data)
       console.log(decode);
    }); 
 }

const getTransactionReceipt = async (tx)=>{
    const receipt = await web3.eth.getTransactionReceipt(tx)
    console.log(receipt);
}

const getSapmContract = async ()=>{
    const address = 'e1e1e1.eth';

    // Get spam contracts
    let spamContracts = await alchemy.nft.getSpamContracts();

    // Get NFTs of owner
    let nfts = await alchemy.nft.getNftsForOwner(address);
    console.log(nfts['ownedNfts'].length);
    console.log("Spam NFTs:")
    counter = 1

    // Print out titles of spam NFTs
    for (let i = 0; i < nfts['ownedNfts'].length; i++) {
        contractAddr = nfts['ownedNfts'][i]['contract']['address'];
        if (spamContracts.includes(contractAddr)) {
            console.log(`${counter}. ${nfts['ownedNfts'][i]['title']}`);
            counter += 1;
        }
    }
}

//keccak("abcdefg")
//nameHash_node("xxxxyz.pado.eth")
//reverseNode("pado.eth")
//hashToString()
//blockSearch()
//ensToAddresss()
//getTransactionReceipt("0x229e29204a85ffe7ae2e765602949a4fa2d36d891514aa0091fd15b3dd20ff16")
getSapmContract()
}

main()



