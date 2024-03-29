const axios = require("axios");
const sdk = require("api")("@opensea/v1.0#mxj1ql5k6c0il");
async function testApi() {
  const data = await axios.get(
    `https://testnet-api.blocksdk.com/v3/klay/info?api_token=${process.env.BLOCKSDKAPI}`
  );
  console.log(data);
}

async function callNFTTokenApi() {
  try {
    console.time("시작");
    const { data } = await axios.get(
      "https://deep-index.moralis.io/api/v2/0x2947f4a9e125ded170950c2f403ee12691447a08/nft?chain=eth&format=decimal",
      {
        headers: {
          accept: "accept: application/json",
          "X-API-Key":
          process.env.BLOCKSDKAPI,
        },
      }
    );
    console.log(data);
    console.timeEnd("시작");
  } catch (e) {
    console.log(e);
  }
}

async function klaytnCallNft() {
  const { data } = await axios.get(
    `https://th-api.klaytnapi.com/v2/account/0x06A09448Ce035F05134EFCD61F66a84a2f68066b/token`,
    {
      headers: {
        "x-chain-id": "8217",
        Authorization:
          "Basic S0FTS0FXWDlPQ0lBUjcxVU02UTNWRjZUOkptN0RHRUtiQ1ZsM3lXdEstaUhKd0tXZmNGQlRmREhuNWExYkZrTzY=",
      },
    }
  );
  console.log(data);
}

async function openSeaApi() {
  console.time("twitter 수집");
  const { data } = await axios.get("https://api.opensea.io/api/v1/assets", {
    headers: {
      Accept: "application/json",
      "X-API-Key": "",
    },
  });
  console.log(data);
}
openSeaApi();
