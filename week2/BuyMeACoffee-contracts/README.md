# Alchemy Road-To-Web3 - Week 2


Deployed week 2 contract on Goerli testnet on 5/19/2022.

Contract address: 0xbC3DcF1f3Edfc7Ee80d78EcA2982C5Be84B31450
Contract address (with challenges implemented): 0xCA8A7cEfA55B2fb30cf74D8e1eE3221F00169f39

Repl.it profile: https://replit.com/@pjfan

Repl.it project link: https://buymeacoffee-solidity-defi-tipping-app.pjfan.repl.co/

Note: Make sure you're using a version of Node that's compatible with Hardhat (in this case I had to downgrade to node@16).

# Setup
```
npm install --save-dev hardhat@^2.9.3 @nomiclabs/hardhat-waffle@^2.0.0 ethereum-waffle@^3.0.0 chai@^4.2.0 @nomiclabs/hardhat-ethers@^2.0.0 ethers@^5.0.0
npm install @openzeppelin/contracts
npm install dotenv
touch .env
```

Add variables to the .env file using .env.example as a guide. MAKE SURE .env IS IN YOUR .gitignore file!!!

# Deploy and Verify
```
npx hardhat run scripts/deploy.js --network goerli
npx hardhat verify --network goerli <YOUR_ADDRESS_HERE>
```
