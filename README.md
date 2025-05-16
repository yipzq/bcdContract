# RemittanceToken Smart Contract Project

This is a blockchain-based remittance token system (RMT) using Ethereum smart contracts. It includes an ERC20-based token contract with features for minting, burning, and transferring tokens.

## Contracts

- **RemittanceToken**: An ERC20 token implementation with additional functionality for remittance operations

## Features

- ERC20 standard token implementation
- Owner-controlled or public token minting
- Token burning functionality
- Backend-initiated transfers for administrative purposes

---

## 📦 Installation

Make sure you have [Node.js](https://nodejs.org/) and [npm](https://www.npmjs.com/) installed.

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd bcdContract
   ```

2. **Install dependencies**

   ```bash
   npm install
   ```

3. **Install OpenZeppelin contracts**
   
   ```bash
   npm install @openzeppelin/contracts
   ```

---

## 🧰 Required Tools 

- [Hardhat](https://hardhat.org/) - Ethereum development environment
- [MetaMask](https://metamask.io/) (recommended) - To interact with the deployed contracts

---

> ⚠️ Never commit your private keys or API keys to version control.

---

## 🚀 Getting Started

Once dependencies are installed and environment is set up:

1. **Start local Ethereum node**

   ```bash
   npx hardhat node
   ```

   This will spin up a local blockchain instance with pre-funded accounts for development.

2. **Deploy contracts**

   ```bash
   npm run deploy
   ```

   This will deploy the RemittanceToken contract to your local network.

3. **Interact with the contract**

   Use the Hardhat console to interact with your deployed contracts:

   ```bash
   npx hardhat console --network localhost
   ```


---

## 🖥️ Frontend Integration

To use your contract in a frontend application:

1. **Copy the contract artifacts**

   After deployment, copy the generated artifact from:
   ```
   artifacts/contracts/RemittanceToken.sol/RemittanceToken.json
   ```

2. **Import to your frontend project**

   Copy this file to your frontend project's directory and rename it to `RemittanceToken.json`.

3. **Import in your frontend code**

   ```javascript
   import RemittanceToken from './path/to/RemittanceToken.json';
   
   // Use the ABI from the artifact
   const contractABI = RemittanceToken.abi;
   ```
---

## 🧪 Testing

Run the test suite to ensure everything works correctly:

```bash
npx hardhat test
```

---

## 📝 Contract Verification

After deployment to a public testnet or mainnet, verify your contract:

```bash
npx hardhat verify --network <network-name> <deployed-contract-address> <constructor-parameters>
```

---

## 📚 Resources

- [Hardhat Documentation](https://hardhat.org/getting-started/)
- [OpenZeppelin Documentation](https://docs.openzeppelin.com/)
- [ERC20 Standard](https://eips.ethereum.org/EIPS/eip-20)
- [Solidity Documentation](https://docs.soliditylang.org/)