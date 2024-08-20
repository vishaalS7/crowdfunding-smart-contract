# 💰 FundMe.sol - A Decentralized Crowdfunding Smart Contract

## 🚀 Project Overview
**FundMe.sol** is a decentralized crowdfunding smart contract built on the Ethereum blockchain, specifically designed for the zkSync testnet. It allows users to create crowdfunding campaigns where supporters can contribute funds directly through the smart contract. The contract ensures transparency and trust by handling contributions and withdrawals securely.

### **New Feature: Off-Chain Hybrid Smart Contract**
We've integrated an off-chain hybrid smart contract using Chainlink's `AggregatorV3Interface`. This allows the contract to fetch live price feeds and perform ETH-to-USD conversion seamlessly. A custom library has been created to handle these conversions, adding a new layer of functionality to the contract.

## 📜 Smart Contract Description
**FundMe.sol** is designed to provide a secure and transparent platform for raising funds for various causes or projects. It leverages the trustless nature of blockchain to manage funds without relying on third-party intermediaries.

### **Key Features:**
- **Fund Contributions:** Supporters can contribute ETH directly to the campaign.
- **Price Feed Integration:** Fetches real-time ETH price using `AggregatorV3Interface` to ensure accurate conversion rates.
- **Conversion Library:** A custom library to get current prices and convert ETH contributions to USD.
- **Withdrawal:** Campaign owners can withdraw funds once the funding goal is met.
- **Minimum Contribution:** Ensures that only meaningful contributions are accepted.


## ⚙️ Functions Overview
### `fund() public payable`
Allows users to contribute ETH to the active campaign. The contribution is added to the total funds raised.

### `withdraw() public`
Allows the campaign creator to withdraw the funds once the funding goal has been met. Only the campaign creator can call this function.

### `getPrice() public view returns (uint256)`
Fetches the current ETH price in USD using the `AggregatorV3Interface`.

### `getConversionRate(uint256 ethAmount) public view returns (uint256)`
Converts the ETH amount to USD using the latest price feed data.


## 🔐 Security Considerations
- **Reentrancy Guard:** The `withdraw` function includes a reentrancy guard to prevent attacks.
- **OnlyOwner Modifier:** Ensures that only the campaign creator can withdraw funds.
- **Minimum Contribution:** A minimum contribution amount is set to filter out spam transactions.
- **Price Feed Reliability:** Integrates Chainlink's reliable price feed to ensure accurate conversions.
