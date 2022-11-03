const Web3 = require("web3");
//const rpcURL = "https://ropsten.infura.io/v3/aac31604e537478088a025712513c0d7";
const rpcURL = "https://mainnet.infura.io/v3/63f3a65f31a2448da88e9e75cc18ce99";
const web3 = new Web3(rpcURL);
const abiDecoder = require("abi-decoder"); // NodeJS
const { Abi } = require("./abi-decoder");

let CA = new web3.eth.Contract(
  [
    {
      inputs: [
        {
          internalType: "address",
          name: "_proxyRegistryAddress",
          type: "address",
        },
      ],
      payable: false,
      stateMutability: "nonpayable",
      type: "constructor",
    },
    {
      anonymous: false,
      inputs: [
        {
          indexed: true,
          internalType: "address",
          name: "_owner",
          type: "address",
        },
        {
          indexed: true,
          internalType: "address",
          name: "_operator",
          type: "address",
        },
        {
          indexed: false,
          internalType: "bool",
          name: "_approved",
          type: "bool",
        },
      ],
      name: "ApprovalForAll",
      type: "event",
    },
    {
      anonymous: false,
      inputs: [
        {
          indexed: false,
          internalType: "uint256",
          name: "token",
          type: "uint256",
        },
        {
          indexed: false,
          internalType: "uint256",
          name: "amount",
          type: "uint256",
        },
        {
          indexed: false,
          internalType: "string",
          name: "name",
          type: "string",
        },
        {
          indexed: false,
          internalType: "address",
          name: "artist",
          type: "address",
        },
      ],
      name: "ArtCreated",
      type: "event",
    },
    {
      anonymous: false,
      inputs: [
        {
          indexed: false,
          internalType: "uint256",
          name: "token",
          type: "uint256",
        },
        {
          indexed: false,
          internalType: "uint256",
          name: "finalBid",
          type: "uint256",
        },
        {
          indexed: false,
          internalType: "address",
          name: "owner",
          type: "address",
        },
        {
          indexed: false,
          internalType: "address",
          name: "newOwner",
          type: "address",
        },
        {
          indexed: false,
          internalType: "uint256",
          name: "auctionIndex",
          type: "uint256",
        },
      ],
      name: "AuctionEnd",
      type: "event",
    },
    {
      anonymous: false,
      inputs: [
        {
          indexed: false,
          internalType: "uint256",
          name: "auctionIndex",
          type: "uint256",
        },
        {
          indexed: false,
          internalType: "uint256",
          name: "newExpiry",
          type: "uint256",
        },
        {
          indexed: false,
          internalType: "uint256",
          name: "newPrice",
          type: "uint256",
        },
      ],
      name: "AuctionReset",
      type: "event",
    },
    {
      anonymous: false,
      inputs: [
        {
          indexed: false,
          internalType: "address",
          name: "creator",
          type: "address",
        },
        {
          indexed: false,
          internalType: "uint256",
          name: "token",
          type: "uint256",
        },
        {
          indexed: false,
          internalType: "uint256",
          name: "startingBid",
          type: "uint256",
        },
        {
          indexed: false,
          internalType: "uint256",
          name: "auctionIndex",
          type: "uint256",
        },
        {
          indexed: false,
          internalType: "uint256",
          name: "expiry",
          type: "uint256",
        },
      ],
      name: "AuctionStart",
      type: "event",
    },
    {
      anonymous: false,
      inputs: [
        {
          indexed: false,
          internalType: "address",
          name: "bidder",
          type: "address",
        },
        {
          indexed: false,
          internalType: "uint256",
          name: "token",
          type: "uint256",
        },
        {
          indexed: false,
          internalType: "uint256",
          name: "auctionIndex",
          type: "uint256",
        },
        {
          indexed: false,
          internalType: "uint256",
          name: "amount",
          type: "uint256",
        },
      ],
      name: "Bid",
      type: "event",
    },
    {
      anonymous: false,
      inputs: [
        {
          indexed: true,
          internalType: "address",
          name: "previousOwner",
          type: "address",
        },
        {
          indexed: true,
          internalType: "address",
          name: "newOwner",
          type: "address",
        },
      ],
      name: "OwnershipTransferred",
      type: "event",
    },
    {
      anonymous: false,
      inputs: [
        {
          indexed: true,
          internalType: "address",
          name: "_operator",
          type: "address",
        },
        {
          indexed: true,
          internalType: "address",
          name: "_from",
          type: "address",
        },
        {
          indexed: true,
          internalType: "address",
          name: "_to",
          type: "address",
        },
        {
          indexed: false,
          internalType: "uint256[]",
          name: "_ids",
          type: "uint256[]",
        },
        {
          indexed: false,
          internalType: "uint256[]",
          name: "_amounts",
          type: "uint256[]",
        },
      ],
      name: "TransferBatch",
      type: "event",
    },
    {
      anonymous: false,
      inputs: [
        {
          indexed: true,
          internalType: "address",
          name: "_operator",
          type: "address",
        },
        {
          indexed: true,
          internalType: "address",
          name: "_from",
          type: "address",
        },
        {
          indexed: true,
          internalType: "address",
          name: "_to",
          type: "address",
        },
        {
          indexed: false,
          internalType: "uint256",
          name: "_id",
          type: "uint256",
        },
        {
          indexed: false,
          internalType: "uint256",
          name: "_amount",
          type: "uint256",
        },
      ],
      name: "TransferSingle",
      type: "event",
    },
    {
      anonymous: false,
      inputs: [
        {
          indexed: false,
          internalType: "string",
          name: "_uri",
          type: "string",
        },
        {
          indexed: true,
          internalType: "uint256",
          name: "_id",
          type: "uint256",
        },
      ],
      name: "URI",
      type: "event",
    },
    {
      constant: true,
      inputs: [],
      name: "auctionCount",
      outputs: [{ internalType: "uint256", name: "", type: "uint256" }],
      payable: false,
      stateMutability: "view",
      type: "function",
    },
    {
      constant: true,
      inputs: [],
      name: "auctionFee",
      outputs: [{ internalType: "uint256", name: "", type: "uint256" }],
      payable: false,
      stateMutability: "view",
      type: "function",
    },
    {
      constant: true,
      inputs: [{ internalType: "uint256", name: "", type: "uint256" }],
      name: "auctionList",
      outputs: [
        { internalType: "address", name: "owner", type: "address" },
        { internalType: "address", name: "lastBidder", type: "address" },
        { internalType: "uint256", name: "bid", type: "uint256" },
        { internalType: "uint256", name: "expiry", type: "uint256" },
        { internalType: "uint256", name: "token", type: "uint256" },
      ],
      payable: false,
      stateMutability: "view",
      type: "function",
    },
    {
      constant: true,
      inputs: [
        { internalType: "address", name: "_owner", type: "address" },
        { internalType: "uint256", name: "_id", type: "uint256" },
      ],
      name: "balanceOf",
      outputs: [{ internalType: "uint256", name: "", type: "uint256" }],
      payable: false,
      stateMutability: "view",
      type: "function",
    },
    {
      constant: true,
      inputs: [
        { internalType: "address[]", name: "_owners", type: "address[]" },
        { internalType: "uint256[]", name: "_ids", type: "uint256[]" },
      ],
      name: "balanceOfBatch",
      outputs: [{ internalType: "uint256[]", name: "", type: "uint256[]" }],
      payable: false,
      stateMutability: "view",
      type: "function",
    },
    {
      constant: false,
      inputs: [{ internalType: "uint256", name: "_index", type: "uint256" }],
      name: "bid",
      outputs: [],
      payable: true,
      stateMutability: "payable",
      type: "function",
    },
    {
      constant: false,
      inputs: [{ internalType: "uint256", name: "_index", type: "uint256" }],
      name: "buy",
      outputs: [],
      payable: true,
      stateMutability: "payable",
      type: "function",
    },
    {
      constant: false,
      inputs: [{ internalType: "uint256", name: "_newPrice", type: "uint256" }],
      name: "changePrintFee",
      outputs: [],
      payable: false,
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      constant: false,
      inputs: [{ internalType: "uint256", name: "_index", type: "uint256" }],
      name: "concludeAuction",
      outputs: [],
      payable: false,
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      constant: false,
      inputs: [
        { internalType: "uint256", name: "_initialSupply", type: "uint256" },
        { internalType: "string", name: "_name", type: "string" },
        { internalType: "string", name: "_uri", type: "string" },
        { internalType: "bytes", name: "_data", type: "bytes" },
      ],
      name: "create",
      outputs: [{ internalType: "uint256", name: "", type: "uint256" }],
      payable: true,
      stateMutability: "payable",
      type: "function",
    },
    {
      constant: false,
      inputs: [
        { internalType: "uint256", name: "_price", type: "uint256" },
        { internalType: "uint256", name: "_expiry", type: "uint256" },
        { internalType: "uint256", name: "_token", type: "uint256" },
        { internalType: "uint256", name: "_amount", type: "uint256" },
      ],
      name: "createAuction",
      outputs: [],
      payable: false,
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      constant: true,
      inputs: [{ internalType: "uint256", name: "", type: "uint256" }],
      name: "creators",
      outputs: [{ internalType: "address", name: "", type: "address" }],
      payable: false,
      stateMutability: "view",
      type: "function",
    },
    {
      constant: false,
      inputs: [
        { internalType: "uint256", name: "_tokenIndex", type: "uint256" },
        { internalType: "string", name: "_uri", type: "string" },
        { internalType: "bytes", name: "_data", type: "bytes" },
      ],
      name: "importToken",
      outputs: [],
      payable: false,
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      constant: true,
      inputs: [
        { internalType: "address", name: "_owner", type: "address" },
        { internalType: "address", name: "_operator", type: "address" },
      ],
      name: "isApprovedForAll",
      outputs: [{ internalType: "bool", name: "isOperator", type: "bool" }],
      payable: false,
      stateMutability: "view",
      type: "function",
    },
    {
      constant: true,
      inputs: [],
      name: "isOwner",
      outputs: [{ internalType: "bool", name: "", type: "bool" }],
      payable: false,
      stateMutability: "view",
      type: "function",
    },
    {
      constant: true,
      inputs: [],
      name: "name",
      outputs: [{ internalType: "string", name: "", type: "string" }],
      payable: false,
      stateMutability: "view",
      type: "function",
    },
    {
      constant: true,
      inputs: [],
      name: "owner",
      outputs: [{ internalType: "address", name: "", type: "address" }],
      payable: false,
      stateMutability: "view",
      type: "function",
    },
    {
      constant: false,
      inputs: [],
      name: "renounceOwnership",
      outputs: [],
      payable: false,
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      constant: false,
      inputs: [
        { internalType: "uint256", name: "_index", type: "uint256" },
        { internalType: "uint256", name: "_expiry", type: "uint256" },
        { internalType: "uint256", name: "_price", type: "uint256" },
      ],
      name: "resetAuction",
      outputs: [],
      payable: false,
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      constant: false,
      inputs: [
        { internalType: "address", name: "_from", type: "address" },
        { internalType: "address", name: "_to", type: "address" },
        { internalType: "uint256[]", name: "_ids", type: "uint256[]" },
        { internalType: "uint256[]", name: "_amounts", type: "uint256[]" },
        { internalType: "bytes", name: "_data", type: "bytes" },
      ],
      name: "safeBatchTransferFrom",
      outputs: [],
      payable: false,
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      constant: false,
      inputs: [
        { internalType: "address", name: "_from", type: "address" },
        { internalType: "address", name: "_to", type: "address" },
        { internalType: "uint256", name: "_id", type: "uint256" },
        { internalType: "uint256", name: "_amount", type: "uint256" },
        { internalType: "bytes", name: "_data", type: "bytes" },
      ],
      name: "safeTransferFrom",
      outputs: [],
      payable: false,
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      constant: false,
      inputs: [
        { internalType: "address", name: "_operator", type: "address" },
        { internalType: "bool", name: "_approved", type: "bool" },
      ],
      name: "setApprovalForAll",
      outputs: [],
      payable: false,
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      constant: false,
      inputs: [{ internalType: "uint256", name: "_newFee", type: "uint256" }],
      name: "setAuctionFee",
      outputs: [],
      payable: false,
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      constant: false,
      inputs: [
        { internalType: "string", name: "_newBaseMetadataURI", type: "string" },
      ],
      name: "setBaseMetadataURI",
      outputs: [],
      payable: false,
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      constant: false,
      inputs: [
        { internalType: "address", name: "_to", type: "address" },
        { internalType: "uint256[]", name: "_ids", type: "uint256[]" },
      ],
      name: "setCreator",
      outputs: [],
      payable: false,
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      constant: true,
      inputs: [
        { internalType: "bytes4", name: "_interfaceID", type: "bytes4" },
      ],
      name: "supportsInterface",
      outputs: [{ internalType: "bool", name: "", type: "bool" }],
      payable: false,
      stateMutability: "view",
      type: "function",
    },
    {
      constant: true,
      inputs: [],
      name: "symbol",
      outputs: [{ internalType: "string", name: "", type: "string" }],
      payable: false,
      stateMutability: "view",
      type: "function",
    },
    {
      constant: false,
      inputs: [],
      name: "toggleImports",
      outputs: [],
      payable: false,
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      constant: true,
      inputs: [{ internalType: "uint256", name: "", type: "uint256" }],
      name: "tokenSupply",
      outputs: [{ internalType: "uint256", name: "", type: "uint256" }],
      payable: false,
      stateMutability: "view",
      type: "function",
    },
    {
      constant: true,
      inputs: [{ internalType: "uint256", name: "_id", type: "uint256" }],
      name: "totalSupply",
      outputs: [{ internalType: "uint256", name: "", type: "uint256" }],
      payable: false,
      stateMutability: "view",
      type: "function",
    },
    {
      constant: false,
      inputs: [{ internalType: "address", name: "newOwner", type: "address" }],
      name: "transferOwnership",
      outputs: [],
      payable: false,
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      constant: true,
      inputs: [{ internalType: "uint256", name: "_id", type: "uint256" }],
      name: "uri",
      outputs: [{ internalType: "string", name: "", type: "string" }],
      payable: false,
      stateMutability: "view",
      type: "function",
    },
  ],
  "0x157fc00b1b8476950381c0b497f4908dfe8c5262"
);

async function tet() {}
async function getInfo() {
  const data = await web3.eth.getTransactionReceipt(
    "0xad913b817dcfc4876ad399c61c15327175f77b151907c2a3275a25abc30a220f"
  );

  console.log(data.logs[0].topics);

  // data.logs.map((e) => {
  //   console.log(e);
  // });

  //  let result = await web3.eth.abi.decodeParameter("string", nameData);
}

//! 깔금하게 하나만 찾으면 맨마지막 log에서 data값을 decode해주면 name이 나온다

// let a = await web3.eth.abi.decodeParameter(
//   "string",
//   "0xf7a1696300000000000000000000000000000000000000000000000000000000000000c00000000000000000000000007e108ba31a178cfd96a0405f68d247f96467b47a0000000000000000000000000000000000000000000000000000000003c30ab03b1bb7a3312443f6438614041bfe5eb0418020033185ee326385fab27ef70ffb0000000000000000000000004976fb03c32e5b8cfe2b6ccb31c09ba78ebaba410000000000000000000000007e108ba31a178cfd96a0405f68d247f96467b47a0000000000000000000000000000000000000000000000000000000000000009747261706174686f6e0000000000000000000000000000000000000000000000"
// );

// console.log(a);

//1. getTransaction으로 값을 받아오는 방법이 있다.

async function getTransaction() {
  const data = await web3.eth.getTransaction(
    // 아무래도 안됬을 확률도 있으니까 정확하지가 않다
    "0xb2edd501b29d26aa3e89b81a895ecb53f2d936d2ba11326c8d143c9a27f42685" //? 변경되는 hash값에서 input data를 가지고 name을 추출했다.
  );
  console.log(data);
  // abiDecoder.addABI(Abi);
  // const decodedData = abiDecoder.decodeMethod(input);
  // console.log(decodedData.params[0].value);
}

async function getTransactionReceipt() {
  //getTransactionReceipt는 mined된것만 가지고 나옵니다.
  const { logs } = await web3.eth.getTransactionReceipt(
    "0xb2edd501b29d26aa3e89b81a895ecb53f2d936d2ba11326c8d143c9a27f42685"
  );

  let result = logs.filter(
    (e) =>
      e.topics[0] ===
      "0xc3d58168c5ae7397731d063d5bbf3d657854427343f4c083240f7aacaa2d0f62" // Register(uint, stirng, )
  );

  console.log(result[0].data);

  let answer = await web3.eth.abi.decodeParameters(
    ["address", "address", "uint256", "uint256", "bytes"],
    "0xf242432a000000000000000000000000997688240e105f7e19021ac1968f2976178960cf00000000000000000000000073f4273d6e040be2fa833af636bcda335d3ce960997688240e105f7e19021ac1968f2976178960cf000000000001530000000001000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
  );
  console.log(answer);
}

async function getUri() {
  // console.log(
  //   web3.utils.soliditySha3(
  //     BigInt(
  //       69413293396425957858338857838706753707756639403455874143082543778783930875905
  //     ).toString()
  //   )
  // );
  // console.log(
  //   await CA.methods
  //     .uri(
  //       BigInt(
  //         69413293396425957858338857838706753707756639403455874143082543778783930875905
  //       )
  //     )
  //     .call()
  // );
  console.log(await CA.methods.uri(7).call());
  // let aa = await CA.methods
  //   .uri("997688240e105f7e19021ac1968f2976178960cf000000000001530000000001")
  //   .call();

  // console.log(aa);
}
//getTransaction();
//getTransactionReceipt();
getUri();
