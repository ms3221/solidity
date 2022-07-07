const ENS = require("ethjs-ens");
const HttpProvider = require("ethjs-provider-http");
const strData = require("./data");

let data = `
matthewliu.eth
deezy.eth
shiv.eth
jeffaphisit.eth
thrivecoin.eth
null.eth
tylersjourney.eth
jessekay.eth
johnzettler.eth
kristiewells.eth
chrysb.eth
jiro.eth
viranda.eth
michaelblumstein.eth
hidayath.eth
alexboyce.eth
donnaharris.eth
jkc.eth
isaidelgoley.eth
bitpixi.eth
zeero.eth
rickysanders.eth
goblinainft.eth
ptiteangele.eth
steki.eth
jxck.eth
muirhead.eth
lugo.eth
aletheia.eth
giveawayplus.eth
punkie.eth
mr0.eth
yazid.eth
donslens.eth
tjc.eth
nyx.eth
fraietta.eth
cooperray.eth
momack.eth
manhattannft.eth
doh.eth
ethan.eth
notso.eth
holidaysidewinder.eth
sakura.eth
expansionpunks.eth
softflex.eth
cyberhokie.eth
sueco.eth
thedefijedi.eth
johnwylie.eth
les.eth
paulkhoury.eth
otter.eth
evanss6.eth
numo.eth
jordi.eth
spancs.eth
bri.eth
sandymeows.eth
francescahogi.eth
remyb.eth
anorak.eth
clintonjr.eth
bertani.eth
taytems.eth
pgsports.eth
nyancat.eth
okduncan.eth
poap.eth
jamierusso.eth
bmer19.eth
rolex1.eth
showmenft.eth
nir.eth
pdx.eth
gail.eth
benahorowitz.eth
fabien.eth
pranksy.eth
anudit.eth
1EthBuyPunk.eth`;

let reviseData = data.replace(/\n|\r|\s*/g, "");

if (typeof window === "object" && typeof window.web3 !== "undefined") {
  setupEns(web3.currentProvider);
} else {
  const provider = new HttpProvider(
    "https://mainnet.infura.io/v3/63f3a65f31a2448da88e9e75cc18ce99"
  );
  setupEns(provider, reviseData);
}

async function setupEns(provider, datas = "") {
  // Currently requires both provider and
  // either a network or registryAddress param
  const ens = new ENS({ provider, network: "3" });

  let arr = datas.trim().split(".eth");
  console.log(arr);
  let count = 0;
  let push = [];

  for (let i = 0; i < arr.length - 1; i++) {
    try {
      const address = await ens.lookup(`${arr[i]}.eth`);
      console.log(address);
    } catch (e) {
      console.log("이상함");
    }
  }

  console.log("끝");
}
