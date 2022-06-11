# Alchemy Road-To-Web3 - Week 3
Deployed week 3 contract on Polygon Mumbai testnet on 5/31/2022.

Contract address: 0xbC3DcF1f3Edfc7Ee80d78EcA2982C5Be84B31450

Contract address (with Challenges Implemented): 0x5E3a9F25ac4912c33a638158D9AEF0cd08c53698

# Setup
```
yarn
yarn add hardhat
yarn add @openzeppelin/contracts
```

Fill in .env file with appropriate values.

# Deploy and Verify
```
npx hardhat compile
npx hardhat run scripts/deploy.js --network mumbai
npx hardhat verify --network mumbai YOUR_SMARTCONTRACT_ADDRESS
```
