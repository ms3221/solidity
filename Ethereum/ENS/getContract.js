const Web3 = require("web3");
const rpcURL = "https://mainnet.infura.io/v3/63f3a65f31a2448da88e9e75cc18ce99";
const web3 = new Web3(rpcURL);

const abi = [
  {
    inputs: [
      { internalType: "bytes4", name: "interfaceByte", type: "bytes4" },
      { internalType: "string", name: "interfaceName", type: "string" },
    ],
    name: "setInterfaceMap",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  { inputs: [], stateMutability: "nonpayable", type: "constructor" },
  {
    inputs: [
      { internalType: "address", name: "contractAddress", type: "address" },
    ],
    name: "_getContract",
    outputs: [
      {
        components: [
          { internalType: "string", name: "i", type: "string" },
          { internalType: "string", name: "n", type: "string" },
          { internalType: "string", name: "s", type: "string" },
          { internalType: "uint8", name: "d", type: "uint8" },
        ],
        internalType: "struct Contract",
        name: "",
        type: "tuple",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      { internalType: "address", name: "contractAddress", type: "address" },
    ],
    name: "_getInterface",
    outputs: [{ internalType: "string", name: "", type: "string" }],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      { internalType: "address", name: "contractAddress", type: "address" },
      { internalType: "uint256", name: "tokenId", type: "uint256" },
    ],
    name: "_getTokenUri",
    outputs: [{ internalType: "string", name: "", type: "string" }],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address[]",
        name: "contractAddresses",
        type: "address[]",
      },
    ],
    name: "getContracts",
    outputs: [
      {
        components: [
          { internalType: "string", name: "i", type: "string" },
          { internalType: "string", name: "n", type: "string" },
          { internalType: "string", name: "s", type: "string" },
          { internalType: "uint8", name: "d", type: "uint8" },
        ],
        internalType: "struct Contract[]",
        name: "",
        type: "tuple[]",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      { internalType: "address[]", name: "addresses", type: "address[]" },
      { internalType: "uint256[]", name: "tokenIds", type: "uint256[]" },
    ],
    name: "getTokenUris",
    outputs: [{ internalType: "string[]", name: "", type: "string[]" }],
    stateMutability: "view",
    type: "function",
  },
];

const getterContract = new web3.eth.Contract(
  abi,
  "0x847a35E21ed39d68737Df17191d9B98768105Ff7"
);

async function getContract() {
  const data = await getterContract.methods
    .getContracts(["0x514abfd5e0f9b1be27c7a793704d3446b07a690d"])
    .call();

  const ss = await getterContract.methods
    .getTokenUris(["0x514abfd5e0f9b1be27c7a793704d3446b07a690d"], [1010])
    .call();
  console.log(ss);
}

getContract();
