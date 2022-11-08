const ENS = require("ethjs-ens");
const HttpProvider = require("ethjs-provider-http");

if (typeof window === "object" && typeof window.web3 !== "undefined") {
  setupEns(web3.currentProvider);
} else {
  const provider = new HttpProvider(
    // "https://mainnet.infura.io/v3/63f3a65f31a2448da88e9e75cc18ce99"
    "https://ropsten.infura.io/v3/aac31604e537478088a025712513c0d7"
  );
  setupEns(provider, "ovdixs.eth");
}

async function setupEns(provider, ensName) {
  const ens = new ENS({ provider, network: "3" });

  // const address = await ens.lookup(ensName);
  const nameHash = await ens.getNamehash(ensName);
  console.log(nameHash);
  //0x0b9db978b9ea4abb89d802a12705e05e9d869d14
  // reverse는 mainName을 set 해야지만 가능 안그러면 ENS name not defined error가 발생함
  const data = await ens.reverse("0xdB41F06dde2AFAD8670ad926499ec2D05da433ce");
  console.log(data);
}
setupEns()