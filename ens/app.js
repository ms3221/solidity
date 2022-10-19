const Web3 = require("web3");
const rpcURL = "https://ropsten.infura.io/v3/aac31604e537478088a025712513c0d7";
const web3 = new Web3(rpcURL);
//const { ENS } = require('@ensdomains/ensjs');
const { ethers } = require("ethers");
//const namehash = require('eth-ens-namehash');
const ENS = require("ethjs-ens");
const HttpProvider = require("ethjs-provider-http");
//const provider = new ethers.providers.JsonRpcProvider(rpcURL);

//const ENSInstance = new ENS()

// 0xdB41F06dde2AFAD8670ad926499ec2D05da433ce
// ovadix

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
  "0x3671aE578E63FdF66ad4F3E12CC0c0d71Ac7510C"
);

const getBlock = async () => {
  // await ENSInstance.setProvider(provider)
  // const history = await ENSInstance.getHistory('test.eth')

  //   console.log(history);
  console.time("ens");
  const data = await CA.methods
    .getNames([
      "0xdb41f06dde2afad8670ad926499ec2d05da433ce",
      "0x0b9dB978b9ea4AbB89d802A12705E05E9D869D14",
    ])
    .call();
  console.log(data);
  // const data = await CA.methods
  //   .getNames([
  //     "0x6080cf28891ebafe772b18aa14c7827bd03acc3e",
  //     "0xa3ca2baff1ae4a3927d4b6db2a2f8743f7e524ab",
  //     "0xcbc992e42acbb0b8a6e43b2f283ca4b3dbc6e1e1",
  //     "0x687b1cdfe8de1a6c6267b97db07487b527007c49",
  //     "0x0d1a2e5536096a9be697dddea582860d054c569c",
  //     "0x43d0c3fc69f0c32d11243c37e60c15363dbc425f",
  //     "0xc597407dfe5376960a1eb600974367608f3a6082",
  //     "0x558c23bc2345fa468bfc97957cd5d01b47c11f31",
  //     "0xbf77111e82a18b3e01c2d837148d01acca487f5f",
  //     "0xde4ffb84e7448e18a910d84f7780372c652ee4e6",
  //     "0x4b5eb5943C60FBC6d94E757c444D4b753087D347",
  //     "0xef20930614a44f6a8745cae5623ec6f21b930a63",
  //     "0x04fb970eeeeeacd74bcfdb48d8db9c39b51290f0",
  //     "0xa2285c0331bb801780d54685b870abfb36235914",
  //     "0xc07b72236a05974f44d402f6ae6ceb5503a0d1cb",
  //     "0x657e3402af9f388bf85ae9cc843adde2452f0049",
  //     "0x5c268faa8547955419d275f5fc4212c90e003287",
  //     "0x6b8df5e554f979dc93905ad42e0973349e4880c3",
  //     "0x8cc0d14f5e9632fc523d7de7808ebe41d2203a08",
  //     "0x6ce9f763d5a83972a1d0926fb2a28d03517f058a",
  //     "0xe092158fa1670b6785e8170ac1e4389a8c2fd6d4",
  //     "0x8a5a7c4e18ed508f9ba4158cd938924593aa1d08",
  //     "0x67d555644fc6e7538a8817a55a32a178391d89bc",
  //     "0x1653b9d9903e2f13925233636a1ede00f960487c",
  //     "0x703243154beef89c3172a366ca3b8ef9d8309bc5",
  //     "0x6ef61b3715c3fa3483340c6d0f44a4cecd96a540",
  //     "0x4fcc4b5be6e8527f337cf392a2b49fa1b53f1e42",
  //     "0x18c6a47aca1c6a237e53ed2fc3a8fb392c97169b",
  //     "0x351422f3c2ccddb87d96e9bb7cb2229e658ae0db",
  //     "0x2421f3efd3f1574154fe143959cf2d2a38106a1f",
  //     "0xf57e4ef250fea9dd551016e14f1390cd36e4e73a",
  //     "0x7952b1ae3808d39765e0abf2479b47691a985946",
  //     "0x6455557742501cbe952052468f4878fd14754ded",
  //     "0xb955db051bf09a645c26730752e28f5e3776088f",
  //     "0xab20d154a5722c4b287c585b0fd882a983f09dd0",
  //     "0x604d2efc07a6b47b7eae38f7de64f3e7b8a8f235",
  //     "0x40536224ef670ca321d5dde316061a5625c05137",
  //     "0xb1d966540a22bf2f100c16c7d25577fd5caf4021",
  //     "0x722dc3837028f4557bffa9351a2bec5b63beb6a1",
  //     "0xdae1e318690dcb647b2fc8718e6c8eb4a87ac19f",
  //     "0x1719c491b26e0831cbe1fba05ffd72eed9aefd7b",
  //     "0x1eb66d76dca11c68de1d6a378a363cd108c6aea7",
  //     "0xe06e2144a0381b4197f32a1df9dc299cf9113b4b",
  //     "0x363c0c01cc2c57d72688d98a92b4f91d6256ad22",
  //     "0x7777777141f111cf9f0308a63dbd9d0cad3010c4",
  //     "0x65892f21a1d6ce485f21e6643d5789962b401321",
  //     "0x3923b539449893acdbf55a7f3e899d01acc68590",
  //     "0x5ecd7f3a2f4ad89d42b4fd2bac7ceaa323f45ec0",
  //     "0x0ee35e75061825233d1832ce54da71b722d4d9d4",
  //     "0xa3f7ce89ff9f480d5178178b4dccbfb9460080ce",
  //     "0x8a1edffc72bb8c5ac31794b9e014a4f54ff67339",
  //     "0x5e8b33ebd72c7d9f32020174f5e827d796a36b44",
  //     "0xa0e2284c43dbfcfdd0ee468c1b7a331b9b9f9001",
  //     "0xc9da5f7c5536fdbb013dc8a7186f36b85d4eabe4",
  //     "0xb7a0946b3057148d0618b7c1857127bbddad8940",
  //     "0x50fb965e292720dcb30634f6ec2b6cca4333fda3",
  //     "0x7fcdd5594af468c8c0936ca09d2d4e1f682aa398",
  //     "0xe31c233f58219ad25025d3b31519ca3c2f7fa4a8",
  //     "0x5fe9cfa5cfecdc333eb102d219b4e77eacde9828",
  //     "0x4e4a3e55fb1396b806febb9126b704a5afb23ee6",
  //     "0x922197fd26290e3af3da0c35e7f4f299d95e8741",
  //     "0x7627dc8cb0e5fbfca188cb329f5b36dce2ed18c1",
  //     "0xC6122b467fE2B1aDE1aEC114d0FF3CD1Aa75C746",
  //     "0x6318fc84bc9126e85c75cb150f966e5ecc39df2a",
  //     "0x49079fa8ee0ceb9a85207c99b87531806591d8c1",
  //     "0xeffed17302faa38e6d16c7a15438d7feab00bc65",
  //     "0xfd627ab6c1fa6877b57dafd459bd0512f86fbc87",
  //     "0x640cc4ce1acdfc35ae92224469e14f131c29b595",
  //     "0xb595d5e5cf1157c4c654bc98f6f576a4408843a0",
  //     "0x09fc1031d03a78ed4f60463fa9749870d33439bc",
  //     "0x50bd7B0BF525aBa9faf856ef7BeBDffad865Cd95",
  //     "0x5cf6e510e0c123e1e839376f8ea1900bb9b9a6c1",
  //     "0x8bc5910d5c5547539b06a385debb69a37ed19341",
  //     "0xe47d71200a9821a12de28a9ca6673cf6fd17e5d0",
  //     "0xca135316c2b4a84b6deb0a730c4e440d7dfd9fef",
  //     "0xe767dd8d24aa928a13f6ef7ed86daac5541beb67",
  //     "0x1dcbb7863137b0928ac30d9e834ffe166c0772a0",
  //     "0xb904a137e81b6a601f4c63561a89372b8294937c",
  //     "0x110B5dF4D963F44840Ca64a748983701e2ae29A7",
  //     "0x2d3b156262fde4a04e1b1b5d53052fc445f5251d",
  //     "0x92f9e5609fea541c1ff44a1722083b3e260498e5",
  //     "0x1319bea0Ca1CDAF781319F74F09B8fA1Ba44fEB7",
  //     "0xf0822f09421f816f738eec6fd895a31f5eeacae5",
  //     "0xdf8d9d688dc5b45c4b9dbab43937e552bff8c7da",
  //     "0xafb1767b94349013d3c8b4bef01077e08dc75cd7",
  //     "0xa28ae3017a1dabca3513bd55336c781dd10ccd4b",
  //     "0x1bba8c389a5e59b6baa68cc118cc8a562aa295e7",
  //     "0x9dc57d2b217cb6882550f293a8191186b7d648d6",
  //     "0xfeb94dae0baeeac7e04ce2431c0f8b504712357d",
  //     "0x46512af98e0d2ba87050d31fb49f196f4383f32a",
  //     "0xbd71f5e17ce3f43270d7682f36dcbe7c3d8630cf",
  //     "0x7f93e3193995c18dab17640fbb0f4973d523fab0",
  //     "0x7e7b1397828a236e62e8c03a9d329650183d32c9",
  //     "0xdd668fb66f24b3a6e721dba91427c01e8bb08614",
  //     "0xe5c9e3c677bdb443a1ee9d8cfce8280b524796b0",
  //     "0x6521ed4b35b2b38840a67753b8fa33bbf9eaf282",
  //     "0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045",
  //     "0x5b76f5B8fc9D700624F78208132f91AD4e61a1f0",
  //     "0xeD98464BDA3cE53a95B50f897556bEDE4316361c",
  //     "0xFc7d0729639BeDaABeD8e948E35829276b842bE0",
  //     "0x8103936E82D11a4D7431B6375816E6141DAbCd85",
  //     "0xB6Aa5a1AA37a4195725cDF1576dc741d359b56bd",
  //     "0x29EA412CC10A9cfC08c2298f382b2Fe01e6CA83b",
  //     "0xc6400A5584db71e41B0E5dFbdC769b54B91256CD",
  //     "0xfD22004806A6846EA67ad883356be810F0428793",
  //     "0x1b523DC90A79cF5ee5d095825e586e33780f7188",
  //     "0xa25803ab86A327786Bb59395fC0164D826B98298",
  //     "0x5D7aAa862681920Ea4f350a670816b0977c80B37",
  //     "0xD387A6E4e84a6C86bd90C158C6028A58CC8Ac459",
  //     "0xff3879B8A363AeD92A6EABa8f61f1A96a9EC3c1e",
  //     "0xB3Cc8d3510F16BcAa7F3fa7241Fef86A3e890C97",
  //     "0x65191F070b7B961741419e37c777fB2cBd497Af1",
  //     "0x52F6D4b32e964d0E8E011D823B50aE36972D7df2",
  //     "0xF121B82D90CC94874526aC99fA4752ef460B21AA",
  //     "0x120c7D4Ca2c778fa01a367c6edff02d05e0FC649",
  //     "0x6E096D5DcD8Ed88732b94dCc8A074546641f377c",
  //     "0xc998f6A5f4c11E89dE6FBd83f1FCc2043606AFf3",
  //     "0xB88F61E6FbdA83fbfffAbE364112137480398018",
  //     "0xFC1AB1Ee5B163879A850477fBfEB35EaeC52aBc8",
  //     "0x4aDf0dbc8bB29A61BE114C22879202A76790C9d9",
  //     "0x8cA732c18050e8B61DE4784549C55130b2E749cA",
  //     "0x8cf4f1c8D3DbeC260006a3e0401a2d723DD9095a",
  //     "0x3087d104F4652AAF3472e419b0e6200179F3297A",
  //     "0x09110b211aaf23b78483ab83A14791C4ed689cdE",
  //     "0x120F8d691e359561ABc080C2A9C98a1DE7a9Fd08",
  //     "0xf0E6D7a40Bb43C6cDeC11D5BBF1583561Cfc0C7a",
  //     "0xE4D7EE76539886CF5f919A91FA48e867D6C98a51",
  //     "0x5b3256965e7C3cF26E11FCAf296DfC8807C01073",
  //     "0x192268A6b20c77D4cfA125D0369a56D515933A32",
  //     "0x97a65648a0fa82ebcd74f9d3c1e69ec8d9574a20",
  //     "0x99e0a40fc2760ea009b0714b3b0028736b7f3635",
  //     "0xc2e5b267ba8b2c10a3f88e9a7634e5357477127d",
  //     "0x296e9a5052e51d725bb0e09671495a3353eb6891",
  //     "0xaaa3bfb53d5d5116faedc5dd457531f8465f78af",
  //     "0xc97E45961135eC0A017b89FBA4Cd79b946f2867e",
  //     "0xFBf84849894F848FcA51F61a72bc1571EaED6731",
  //     "0x2A693cCbda744faf14ecb7C28bD811927BEA61A7",
  //     "0x5bca4075dfc8065235cf75c6b15b410e62845fec",
  //     "0xb8659f9034fdb8608598f7295b6b82869c379510",
  //     "0x1890426e1feec62512d8c62440f1eb4e6f96c531",
  //     "0x55e0f7a3bb39a28bd7bcc458e04b3cf00ad3219e",
  //     "0x2d3162890e0a81bb0f4a1f65e8878d20853f6216",
  //     "0xfe2db8251402553249c193eF16bb71dacfAe4666",
  //     "0xC7ce9AFe9d5bfcEb360f5f5c7c0a5576bd880a9A",
  //     "0x0b9db978b9ea4abb89d802a12705e05e9d869d14",
  //     "0x844BFee650ca19E73d94c8d4345F1762DBDcc72A",
  //     "0x851b660c0b88032Ba73e95fee1346c52ec34c5Ef",
  //     "0xbE0536665a5Fa2D6162BCF81B4eBaAa8d0eF0E6d",
  //     "0x4861babe0C26866d4f1F8C64461827967cDD8fB1",
  //     "0x377b59225EF9a706D196b936d6D8b682D24D0cef",
  //     "0x2aa09de8D36681A437Fd7bd572182d02fFb29Cd5",
  //     "0x1268CF5815a173818c0ccc489e1C0585e5f203bd",
  //     "0xeEC317A52704E0D80A60Dd53D451b04f2a7378aD",
  //     "0xF5fd21C89d5E2206bD6184E88486B61fC5093894",
  //     "0x15F4b11e24BbB578026f3b38AD5A8B7cf5799343",
  //   ])
  // .call();
  // const str = "aa.eth  asf.eth";
  // const result = str.replace(/ /g, "");
  // console.log(result);
  // console.log(result.split(".eth"));

  console.timeEnd("ens");
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
};

getBlock();

function setupEns() {
  const provider = new HttpProvider(
    "https://mainnet.infura.io/v3/63f3a65f31a2448da88e9e75cc18ce99"
  );
  // Currently requires both provider and
  // either a network or registryAddress param

  const ens = new ENS({ provider, network: "1" });
  async function test() {
    const address = await ens.getResolverAddress("ovadix.eth");
    const addr = await ens.getOwner("ovadix.eth");
    console.log(address);
    console.log(addr);
  }
  //test();
  // const name = await ens.reverse("0x0b9dB978b9ea4AbB89d802A12705E05E9D869D14");
  // console.log(name);
  // // ens.lookup('ovadix.eth')
  // .then((address) => {
  //   const expected = '0x5f8f68a0d1cbc75f6ef764a44619277092c32df0'
  //    console.log(address);
  //   if (address === expected) {
  //     alert("That's how you do it!")
  //   }
  // })
  // .catch((reason) => {
  //   // There was an issue!
  //   // Maybe the name wasn't registered!
  //   console.error(reason)
  // })
}
//setupEns();
