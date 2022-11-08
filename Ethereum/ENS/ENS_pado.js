const Web3 = require("web3");
const rpcURL = "https://eth-goerli.g.alchemy.com/v2/jVomEiZSaJt79dNlKuCnnKH8p9BMNc81";
const web3 = new Web3(rpcURL);
const namehash = require("eth-ens-namehash");

/**
 *  testnet = goerli ENS
 *  resolver : 0xE264d5bb84bA3b8061ADC38D3D76e6674aB91852
 *  _ens : 0x00000000000C2E074eC69A0dFb2997BA6C7d2e1e
 *  rootNoode : 0xfd7f5c28743a891291f9f9971b1e06920f5a26919632c52b05c186bbc4d2fb54(pado.eth nameHash)
 */

const getBlock = async ()=>{
    const blockData = await web3.eth.getBlock('latest');
    console.log(blockData);
}

const ensToAddresss = async ()=>{
    var address = await web3.eth.ens.getAddress('teest.pado.eth');
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
   
}
//keccak("abcde")
//nameHash_node("ovadixs.eth")
reverseNode("0xb5C7790B60de2A1E214C88ED648fa1593C58b7B8")
//hashToString()