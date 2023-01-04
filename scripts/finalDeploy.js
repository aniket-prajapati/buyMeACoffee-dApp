const hre = require("hardhat");

async function main() {
  const coffee = await hre.ethers.getContractFactory("Coffee");
  const coffeeContract = await coffee.deploy();
  await coffeeContract.deployed();
  console.log("Coffee deployed to:", coffeeContract.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
