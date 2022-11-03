const Web3 = require("web3");
const rpcURL = "https://mainnet.infura.io/v3/63f3a65f31a2448da88e9e75cc18ce99";
//https://ropsten.infura.io/v3/aac31604e537478088a025712513c0d7
//https://mainnet.infura.io/v3/63f3a65f31a2448da88e9e75cc18ce99
const web3 = new Web3(rpcURL);

//*ens 라이브러리를 설정해서 함수를 사용해보기 위함 (설정정보)
const { ethers } = require("ethers");
const ENS = require("ethjs-ens");
const HttpProvider = require("ethjs-provider-http");
const namehash = require("eth-ens-namehash");
//! 직접적으로 컨트랙트에 호출하기위해서 설정
//* ens call ropsten contractAddress => 0x72c33B247e62d0f1927E8d325d0358b8f9971C68 (reverse)
//*          mainnet contractAddress => 0x3671aE578E63FdF66ad4F3E12CC0c0d71Ac7510C (reverse)
//* 순방향 ENS contract  => 0x00000000000C2E074eC69A0dFb2997BA6C7d2e1e
const abi = [
  {
    inputs: [{ internalType: "contract ENS", name: "_ens", type: "address" }],
    stateMutability: "nonpayable",
    type: "constructor",
  },
  {
    inputs: [
      { internalType: "address[]", name: "addresses", type: "address[]" },
    ],
    name: "getNames",
    outputs: [{ internalType: "string[]", name: "r", type: "string[]" }],
    stateMutability: "view",
    type: "function",
  },
];
const CA = new web3.eth.Contract(
  abi,
  "0x72c33B247e62d0f1927E8d325d0358b8f9971C68"
);

async function getBlock() {
  const blockNumber = await web3.eth.getBlock("latest");
  console.log(blockNumber);
}

async function callEnsContract() {
  console.time("ens");
  const data = await CA.methods
    .getNames([
      "0xdb41f06dde2afad8670ad926499ec2d05da433ce",
      "0x0b9dB978b9ea4AbB89d802A12705E05E9D869D14",
    ])
    .call();
  console.log(data);
  console.timeEnd();
}

//! 지금부터는 라이브러리 함수를 호출

async function callEnsApi() {
  const provider = new HttpProvider(
    "https://ropsten.infura.io/v3/aac31604e537478088a025712513c0d7"
  );
  const ens = new ENS({ provider, network: "3" });
  const name = await ens.reverse("0xdb41f06dde2afad8670ad926499ec2d05da433ce");
  const resolver = await ens.getResolver(name);
  console.log(name, resolver);
}

async function etherJsApi() {
  const provider = new ethers.providers.JsonRpcProvider(
    "https://mainnet.infura.io/v3/63f3a65f31a2448da88e9e75cc18ce99"
  );
  const signer = provider.getSigner();
  // const ensName = await provider.lookupAddress(
  //   "0xb8c2C29ee19D8307cb7255e1Cd9CbDE883A267d5"
  // );
  const address = await provider.resolveName("nick.eth");
  console.log(address);
  console.time("ens");
  const resolver = await provider.getResolver("nick.eth");
  //   const resolverAddress = await provider.getname("ovdixs.eth");
  //   console.log(resolverAddress);
  console.log(resolver);
  console.log(await resolver.getText("email"));
  console.timeEnd("ens");
}

async function ensJSApi() {
  const provider = new HttpProvider(
    "https://ropsten.infura.io/v3/aac31604e537478088a025712513c0d7"
  );
}

//! ENS Text를 가져오는 contract 작성

async function getTextContract() {
  const abi2 = [
    {
      constant: true,
      inputs: [
        { internalType: "bytes32", name: "node", type: "bytes32" },
        { internalType: "string", name: "key", type: "string" },
      ],
      name: "text",
      outputs: [{ internalType: "string", name: "", type: "string" }],
      payable: false,
      stateMutability: "view",
      type: "function",
    },
  ];

  const CA2 = new web3.eth.Contract(
    abi2,
    "0x4976fb03c32e5b8cfe2b6ccb31c09ba78ebaba41"
  );
  // Mainnet resolverADDRESS 0x4976fb03c32e5b8cfe2b6ccb31c09ba78ebaba41
  // ropsten resolverADDRESS 0x42D63ae25990889E35F215bC95884039Ba354115

  console.time("enstime");
  var hash = namehash.hash("nick.eth");
  const text = await CA2.methods.text(hash, "com.twitter").call();
  console.log(text);
  console.timeEnd("enstime");
}
getTextContract();
