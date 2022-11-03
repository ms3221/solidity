require("@nomicfoundation/hardhat-toolbox");
require("hardhat-gas-reporter");
require("dotenv").config();
console.log(process.env.REPORT_GAS);

/** @type import('hardhat/config').HardhatUserConfig */

module.exports = {
  solidity: "0.8.17",
  settings: {
    optimizer: {
      // Toggles whether the optimizer is on or off.
      // It's good to keep it off for development
      // and turn on for when getting ready to launch.
      enabled: true,
      // The number of runs specifies roughly how often
      // the deployed code will be executed across the
      // life-time of the contract.
      runs: 300,
    },
  },
  gasReporter: {
    outputFile: "gas-report.txt",
    enabled: process.env.REPORT_GAS !== undefined,
    currency: "KRW",
    noColors: true,
    coinmarketcap: process.env.COIN_MARKETCAP_API_KEY || "",
    token: "ETH",
  },
};
