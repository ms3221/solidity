const Web3 =  require('web3')
const rpcURL = "https://mainnet.infura.io/v3/63f3a65f31a2448da88e9e75cc18ce99";
const web3 = new Web3(rpcURL);
//const { ENS } = require('@ensdomains/ensjs');
// const { ethers } =require('ethers');
//const namehash = require('eth-ens-namehash');
// const ENS = require('ethjs-ens')
// const HttpProvider = require('ethjs-provider-http')
//const provider = new ethers.providers.JsonRpcProvider(rpcURL)

//const ENSInstance = new ENS()

// 0xdB41F06dde2AFAD8670ad926499ec2D05da433ce
// ovadix 

 const abi = [{"inputs":[{"internalType":"contract ENS","name":"_ens","type":"address"}],"stateMutability":"nonpayable","type":"constructor"},{"inputs":[{"internalType":"address[]","name":"addresses","type":"address[]"}],"name":"getNames","outputs":[{"internalType":"string[]","name":"r","type":"string[]"}],"stateMutability":"view","type":"function"}];

 const CA = new web3.eth.Contract(abi,"0x3671aE578E63FdF66ad4F3E12CC0c0d71Ac7510C");

const getBlock = async ()=>{
    // await ENSInstance.setProvider(provider)
    // const history = await ENSInstance.getHistory('test.eth')

    //   console.log(history);
    console.time('ens');
    const data = await CA.methods.getNames(['0xaC780038C3b4248F1AA5f2e1856292A0E908ad84']).call();
    console.log(data);
    console.timeEnd('ens');
    //var address = await provider.resolveName('ovadix.eth');
    //const name = await provider.resolveName("ovadix.eth");
    //const resolver = await provider.getResolver("ovadix.eth");
    // let name = await provider.lookupAddress('0xdB41F06dde2AFAD8670ad926499ec2D05da433ce');
    // console.log(name);
    

    //var address = await ENSInstance.getAddr('0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045');
    //console.log(address);
//    const address = "0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045";
//    let ensName = 
//      await ENSInstance.getName(address)
//    console.log(ensName);
}

// if (typeof window === 'object' && typeof window.web3 !== 'undefined') {
//     //setupEns(web3.currentProvider)
//   } else {
//     const provider = new HttpProvider('https://ropsten.infura.io/v3/')
//     //setupEns(provider)
//   }
  
//  async function setupEns (provider) {
  
//     // Currently requires both provider and
//     // either a network or registryAddress param
//     const data = await CA.methods.getNames(["0xdb41f06dde2afad8670ad926499ec2d05da433ce","0x0b9dB978b9ea4AbB89d802A12705E05E9D869D14"]).call();
//     console.log(data);
//     const ens = new ENS({ provider, network: '3' })
//     const name = await ens.reverse('0xdb41f06dde2afad8670ad926499ec2d05da433ce')
//     console.log(name);
//     // ens.lookup('ovadix.eth')
//     // .then((address) => {
//     //   const expected = '0x5f8f68a0d1cbc75f6ef764a44619277092c32df0'
//     //    console.log(address);
//     //   if (address === expected) {
//     //     alert("That's how you do it!")
//     //   }
//     // })
//     // .catch((reason) => {
//     //   // There was an issue!
//     //   // Maybe the name wasn't registered!
//     //   console.error(reason)
//     // })
//   }


  async function test(){
    var address = await web3.eth.ens.getAddress('thecursedchild.eth');
    console.log(address);
  }
  getBlock()