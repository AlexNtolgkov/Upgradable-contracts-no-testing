# Upgradeable Zoo Project

## Overview
Upgradeable Zoo is a Solidity smart contract project implementing UUPS (Universal Upgradeable Proxy Standard) pattern for zoo management. It allows tracking of visitor counts with upgrade capabilities using blockchain technology.

## Project Structure
```
.
├── lib
│   ├── openzeppelin-contracts-upgradeable
│   ├── openzeppelin-contracts
│   └── forge-std
├── src
│   ├── Zoo1.sol
│   └── Zoo2.sol
├── script
│   └── DeployZoo.sol
├── .gitignore
├── .gitmodules
├── README.md
└── foundry.toml
```

## Smart Contracts: Zoo System
The project consists of three main contracts:

### Zoo1.sol (Initial Implementation)
- Tracking total visitors
- View function for visitor count
- Version tracking (v1)
- Upgradeable functionality
- Ownership controls

### Zoo2.sol (Upgraded Implementation)
- Enhanced visitor tracking
- Setter function for visitor count
- Version tracking (v2)
- Full backward compatibility

### Key Functions
1. `initialize()`: Initializes the contract with owner
2. `GetnumberofVisitors()`: Returns current visitor count
3. `setNumberofVisitors(uint256)`: Sets new visitor count
4. `version()`: Returns contract version
5. `_authorizeUpgrade()`: Handles upgrade authorization

## Setup and Installation
This project uses [Foundry](https://book.getfoundry.sh/) for Ethereum development.

1. Install Foundry:
   ```
   curl -L https://foundry.paradigm.xyz | bash
   foundryup
   ```

2. Clone the repository:
   ```
   git clone <your-repository-url>
   cd upgradeable-zoo
   ```

3. Install dependencies:
   ```
   forge install
   ```

## Building and Testing
- To build the project:
  ```
  forge build
  ```

- To run tests:
  ```
  forge test
  ```

## Deployment
To deploy the initial implementation and proxy:
```
forge script script/DeployZoo.s.sol:DeployZoo --rpc-url <YOUR_RPC_URL> --private-key <YOUR_PRIVATE_KEY> --broadcast
```

For upgrading to Zoo2:
```
forge create src/Zoo2.sol:Zoo2 --rpc-url <YOUR_RPC_URL> --private-key <YOUR_PRIVATE_KEY>
```

## Usage
After deployment, interact with the proxy contract using cast:

```
# Get visitor count
cast call <PROXY_ADDRESS> "getNumberofVisitors()" --rpc-url <YOUR_RPC_URL>

# Set visitor count (After upgrade)
cast send <PROXY_ADDRESS> "setNumberofVisitors(uint256)" 100 --rpc-url <YOUR_RPC_URL> --private-key <YOUR_PRIVATE_KEY>
```

## Contributing
Contributions are welcome. Please open an issue or submit a pull request.

## License
This project is licensed under the MIT License.
