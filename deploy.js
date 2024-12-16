require("dotenv").config();
const hre = require("hardhat");

async function main() {
  // Get the ContractFactory
  const CarbonCreditRanker = await hre.ethers.getContractFactory(
    "CarbonCreditRanker"
  );

  console.log("Deploying the contract...");
  const carbonCreditRanker = await CarbonCreditRanker.deploy();

  await carbonCreditRanker.deployed();

  console.log("Contract deployed to:", carbonCreditRanker.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
