const Web3 = require("web3");
//const rpcURL = "https://ropsten.infura.io/v3/aac31604e537478088a025712513c0d7";
const rpcURL = "https://mainnet.infura.io/v3/63f3a65f31a2448da88e9e75cc18ce99s";
const web3 = new Web3(rpcURL);
const namehash = require("eth-ens-namehash");

async function getTextContract() {
  const abi2 = [
    {
      inputs: [{ internalType: "contract ENS", name: "_ens", type: "address" }],
      payable: false,
      stateMutability: "nonpayable",
      type: "constructor",
    },
    {
      anonymous: false,
      inputs: [
        {
          indexed: true,
          internalType: "bytes32",
          name: "node",
          type: "bytes32",
        },
        {
          indexed: true,
          internalType: "uint256",
          name: "contentType",
          type: "uint256",
        },
      ],
      name: "ABIChanged",
      type: "event",
    },
    {
      anonymous: false,
      inputs: [
        {
          indexed: true,
          internalType: "bytes32",
          name: "node",
          type: "bytes32",
        },
        { indexed: false, internalType: "address", name: "a", type: "address" },
      ],
      name: "AddrChanged",
      type: "event",
    },
    {
      anonymous: false,
      inputs: [
        {
          indexed: true,
          internalType: "bytes32",
          name: "node",
          type: "bytes32",
        },
        {
          indexed: false,
          internalType: "uint256",
          name: "coinType",
          type: "uint256",
        },
        {
          indexed: false,
          internalType: "bytes",
          name: "newAddress",
          type: "bytes",
        },
      ],
      name: "AddressChanged",
      type: "event",
    },
    {
      anonymous: false,
      inputs: [
        {
          indexed: true,
          internalType: "bytes32",
          name: "node",
          type: "bytes32",
        },
        {
          indexed: true,
          internalType: "address",
          name: "owner",
          type: "address",
        },
        {
          indexed: true,
          internalType: "address",
          name: "target",
          type: "address",
        },
        {
          indexed: false,
          internalType: "bool",
          name: "isAuthorised",
          type: "bool",
        },
      ],
      name: "AuthorisationChanged",
      type: "event",
    },
    {
      anonymous: false,
      inputs: [
        {
          indexed: true,
          internalType: "bytes32",
          name: "node",
          type: "bytes32",
        },
        { indexed: false, internalType: "bytes", name: "hash", type: "bytes" },
      ],
      name: "ContenthashChanged",
      type: "event",
    },
    {
      anonymous: false,
      inputs: [
        {
          indexed: true,
          internalType: "bytes32",
          name: "node",
          type: "bytes32",
        },
        { indexed: false, internalType: "bytes", name: "name", type: "bytes" },
        {
          indexed: false,
          internalType: "uint16",
          name: "resource",
          type: "uint16",
        },
        {
          indexed: false,
          internalType: "bytes",
          name: "record",
          type: "bytes",
        },
      ],
      name: "DNSRecordChanged",
      type: "event",
    },
    {
      anonymous: false,
      inputs: [
        {
          indexed: true,
          internalType: "bytes32",
          name: "node",
          type: "bytes32",
        },
        { indexed: false, internalType: "bytes", name: "name", type: "bytes" },
        {
          indexed: false,
          internalType: "uint16",
          name: "resource",
          type: "uint16",
        },
      ],
      name: "DNSRecordDeleted",
      type: "event",
    },
    {
      anonymous: false,
      inputs: [
        {
          indexed: true,
          internalType: "bytes32",
          name: "node",
          type: "bytes32",
        },
      ],
      name: "DNSZoneCleared",
      type: "event",
    },
    {
      anonymous: false,
      inputs: [
        {
          indexed: true,
          internalType: "bytes32",
          name: "node",
          type: "bytes32",
        },
        {
          indexed: true,
          internalType: "bytes4",
          name: "interfaceID",
          type: "bytes4",
        },
        {
          indexed: false,
          internalType: "address",
          name: "implementer",
          type: "address",
        },
      ],
      name: "InterfaceChanged",
      type: "event",
    },
    {
      anonymous: false,
      inputs: [
        {
          indexed: true,
          internalType: "bytes32",
          name: "node",
          type: "bytes32",
        },
        {
          indexed: false,
          internalType: "string",
          name: "name",
          type: "string",
        },
      ],
      name: "NameChanged",
      type: "event",
    },
    {
      anonymous: false,
      inputs: [
        {
          indexed: true,
          internalType: "bytes32",
          name: "node",
          type: "bytes32",
        },
        { indexed: false, internalType: "bytes32", name: "x", type: "bytes32" },
        { indexed: false, internalType: "bytes32", name: "y", type: "bytes32" },
      ],
      name: "PubkeyChanged",
      type: "event",
    },
    {
      anonymous: false,
      inputs: [
        {
          indexed: true,
          internalType: "bytes32",
          name: "node",
          type: "bytes32",
        },
        {
          indexed: true,
          internalType: "string",
          name: "indexedKey",
          type: "string",
        },
        { indexed: false, internalType: "string", name: "key", type: "string" },
      ],
      name: "TextChanged",
      type: "event",
    },
    {
      constant: true,
      inputs: [
        { internalType: "bytes32", name: "node", type: "bytes32" },
        { internalType: "uint256", name: "contentTypes", type: "uint256" },
      ],
      name: "ABI",
      outputs: [
        { internalType: "uint256", name: "", type: "uint256" },
        { internalType: "bytes", name: "", type: "bytes" },
      ],
      payable: false,
      stateMutability: "view",
      type: "function",
    },
    {
      constant: true,
      inputs: [{ internalType: "bytes32", name: "node", type: "bytes32" }],
      name: "addr",
      outputs: [{ internalType: "address payable", name: "", type: "address" }],
      payable: false,
      stateMutability: "view",
      type: "function",
    },
    {
      constant: true,
      inputs: [
        { internalType: "bytes32", name: "node", type: "bytes32" },
        { internalType: "uint256", name: "coinType", type: "uint256" },
      ],
      name: "addr",
      outputs: [{ internalType: "bytes", name: "", type: "bytes" }],
      payable: false,
      stateMutability: "view",
      type: "function",
    },
    {
      constant: true,
      inputs: [
        { internalType: "bytes32", name: "", type: "bytes32" },
        { internalType: "address", name: "", type: "address" },
        { internalType: "address", name: "", type: "address" },
      ],
      name: "authorisations",
      outputs: [{ internalType: "bool", name: "", type: "bool" }],
      payable: false,
      stateMutability: "view",
      type: "function",
    },
    {
      constant: false,
      inputs: [{ internalType: "bytes32", name: "node", type: "bytes32" }],
      name: "clearDNSZone",
      outputs: [],
      payable: false,
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      constant: true,
      inputs: [{ internalType: "bytes32", name: "node", type: "bytes32" }],
      name: "contenthash",
      outputs: [{ internalType: "bytes", name: "", type: "bytes" }],
      payable: false,
      stateMutability: "view",
      type: "function",
    },
    {
      constant: true,
      inputs: [
        { internalType: "bytes32", name: "node", type: "bytes32" },
        { internalType: "bytes32", name: "name", type: "bytes32" },
        { internalType: "uint16", name: "resource", type: "uint16" },
      ],
      name: "dnsRecord",
      outputs: [{ internalType: "bytes", name: "", type: "bytes" }],
      payable: false,
      stateMutability: "view",
      type: "function",
    },
    {
      constant: true,
      inputs: [
        { internalType: "bytes32", name: "node", type: "bytes32" },
        { internalType: "bytes32", name: "name", type: "bytes32" },
      ],
      name: "hasDNSRecords",
      outputs: [{ internalType: "bool", name: "", type: "bool" }],
      payable: false,
      stateMutability: "view",
      type: "function",
    },
    {
      constant: true,
      inputs: [
        { internalType: "bytes32", name: "node", type: "bytes32" },
        { internalType: "bytes4", name: "interfaceID", type: "bytes4" },
      ],
      name: "interfaceImplementer",
      outputs: [{ internalType: "address", name: "", type: "address" }],
      payable: false,
      stateMutability: "view",
      type: "function",
    },
    {
      constant: false,
      inputs: [{ internalType: "bytes[]", name: "data", type: "bytes[]" }],
      name: "multicall",
      outputs: [{ internalType: "bytes[]", name: "results", type: "bytes[]" }],
      payable: false,
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      constant: true,
      inputs: [{ internalType: "bytes32", name: "node", type: "bytes32" }],
      name: "name",
      outputs: [{ internalType: "string", name: "", type: "string" }],
      payable: false,
      stateMutability: "view",
      type: "function",
    },
    {
      constant: true,
      inputs: [{ internalType: "bytes32", name: "node", type: "bytes32" }],
      name: "pubkey",
      outputs: [
        { internalType: "bytes32", name: "x", type: "bytes32" },
        { internalType: "bytes32", name: "y", type: "bytes32" },
      ],
      payable: false,
      stateMutability: "view",
      type: "function",
    },
    {
      constant: false,
      inputs: [
        { internalType: "bytes32", name: "node", type: "bytes32" },
        { internalType: "uint256", name: "contentType", type: "uint256" },
        { internalType: "bytes", name: "data", type: "bytes" },
      ],
      name: "setABI",
      outputs: [],
      payable: false,
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      constant: false,
      inputs: [
        { internalType: "bytes32", name: "node", type: "bytes32" },
        { internalType: "uint256", name: "coinType", type: "uint256" },
        { internalType: "bytes", name: "a", type: "bytes" },
      ],
      name: "setAddr",
      outputs: [],
      payable: false,
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      constant: false,
      inputs: [
        { internalType: "bytes32", name: "node", type: "bytes32" },
        { internalType: "address", name: "a", type: "address" },
      ],
      name: "setAddr",
      outputs: [],
      payable: false,
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      constant: false,
      inputs: [
        { internalType: "bytes32", name: "node", type: "bytes32" },
        { internalType: "address", name: "target", type: "address" },
        { internalType: "bool", name: "isAuthorised", type: "bool" },
      ],
      name: "setAuthorisation",
      outputs: [],
      payable: false,
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      constant: false,
      inputs: [
        { internalType: "bytes32", name: "node", type: "bytes32" },
        { internalType: "bytes", name: "hash", type: "bytes" },
      ],
      name: "setContenthash",
      outputs: [],
      payable: false,
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      constant: false,
      inputs: [
        { internalType: "bytes32", name: "node", type: "bytes32" },
        { internalType: "bytes", name: "data", type: "bytes" },
      ],
      name: "setDNSRecords",
      outputs: [],
      payable: false,
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      constant: false,
      inputs: [
        { internalType: "bytes32", name: "node", type: "bytes32" },
        { internalType: "bytes4", name: "interfaceID", type: "bytes4" },
        { internalType: "address", name: "implementer", type: "address" },
      ],
      name: "setInterface",
      outputs: [],
      payable: false,
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      constant: false,
      inputs: [
        { internalType: "bytes32", name: "node", type: "bytes32" },
        { internalType: "string", name: "name", type: "string" },
      ],
      name: "setName",
      outputs: [],
      payable: false,
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      constant: false,
      inputs: [
        { internalType: "bytes32", name: "node", type: "bytes32" },
        { internalType: "bytes32", name: "x", type: "bytes32" },
        { internalType: "bytes32", name: "y", type: "bytes32" },
      ],
      name: "setPubkey",
      outputs: [],
      payable: false,
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      constant: false,
      inputs: [
        { internalType: "bytes32", name: "node", type: "bytes32" },
        { internalType: "string", name: "key", type: "string" },
        { internalType: "string", name: "value", type: "string" },
      ],
      name: "setText",
      outputs: [],
      payable: false,
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      constant: true,
      inputs: [{ internalType: "bytes4", name: "interfaceID", type: "bytes4" }],
      name: "supportsInterface",
      outputs: [{ internalType: "bool", name: "", type: "bool" }],
      payable: false,
      stateMutability: "pure",
      type: "function",
    },
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
    "0x42D63ae25990889E35F215bC95884039Ba354115"
  );
  // Mainnet resolverADDRESS 0x4976fb03c32e5b8cfe2b6ccb31c09ba78ebaba41
  // ropsten resolverADDRESS 0x42D63ae25990889E35F215bC95884039Ba354115

  var hash = namehash.hash("ovdixs.eth");
  console.log(hash);
  const text = await CA2.methods
    .name("0xb957f11113993ad75c37544f4cfc77e42b4e3df97ffcb739767f76fab1be1375")
    .call();
  console.log(text);
}

async function getInfo() {
  console.log(web3);
}

getInfo();
