const hre = require("hardhat");

async function main() {
  const MyNFT = await hre.ethers.getContractFactory("MyNFT");
  const myNFTCollection = await MyNFT.deploy();

  await myNFTCollection.deployed();

  console.log("NFT collection creted by AI is deployed to:", myNFTCollection.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
