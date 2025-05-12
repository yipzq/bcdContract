# RemittanceToken Smart Contract Project

This project implements a remittance token system, RMT using Ethereum smart contracts. It includes an ERC20-based token contract with features for minting, burning, and transferring tokens.

## Contracts

- **RemittanceToken**: An ERC20 token implementation with additional functionality for remittance operations

## Features

- ERC20 standard token implementation
- Owner-controlled or public token minting
- Token burning functionality
- Backend-initiated transfers for administrative purposes

## Setup

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd bcdContract
   ```

2. **Install dependencies**

   ```bash
   npm install
   ```

3. **Start local Ethereum node**

   ```bash
   npx hardhat node
   ```

   This will spin up a local blockchain instance with pre-funded accounts for development.

4. **Deploy contracts**
   ```bash
   npm run deploy
   ```
   This will deploy the RemittanceToken contract to your local network.
