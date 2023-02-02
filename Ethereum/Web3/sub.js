const Web3 = require("web3");

const rpcURL = "ws://127.0.0.1:7545";
const web3 = new Web3(rpcURL);
//const rpcURL = "https://mainnet.infura.i

let listenOnce = () => {
  // Create a connection to Thundercore mainet.

  const smartContractAddress = "0x6D4355F009fD23be690A602d71eBB539Bf4B3b57";

  var subscription = web3.eth
    .subscribe(
      "logs",
      {
        address: smartContractAddress,
      },
      (error, result) => {
        if (error) {
          console.log(error);
          console.log("Reconnecting to Thundercore mainnet.");
          setTimeout(() => {
            // Re-instantiating web3 is needed in case the connection is dropped.
            web3 = new Web3(provider);
            _listen();
          }, 5000);
        }
      }
    )
    .on("connected", (subscriptionId) => {
      console.log("connected");
    })
    .on("data", (log) => {
      console.log(log);
    })
    .on("changed", (log) => {
      console.log("changed");
    });

  return subscription;
};

const _listen = async () => {
  let tips = listenOnce();
  console.log("Connected to Thundercore mainnet.");

  // web3 subscription times out at 60 secs. Close and reopen at 50 secs.
  setInterval(() => {
    tips.unsubscribe((error, success) => {
      if (error) {
        console.log("Failed to disconnect from Thundercore mainnet!");
      }
      if (success) {
        console.log("disconnected");
      }
    });
    tips = listenOnce();
  }, 50 * 1000);
};

_listen();
