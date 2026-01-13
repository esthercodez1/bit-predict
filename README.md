# BitPredict - Decentralized Prediction Markets on Stacks

A trustless prediction market protocol for speculating on Bitcoin price movements, powered by Stacks Layer-2 smart contracts.

## Project Overview

BitPredict enables decentralized creation and participation in prediction markets for Bitcoin price trajectories. Key features:

- **Non-custodial STX staking** on "Up" or "Down" market outcomes
- **Transparent resolution** using decentralized price oracles
- **Automatic payout distribution** with built-in protocol fees
- **Time-bound markets** anchored to Bitcoin block heights
- **Fully on-chain** logic with verifiable fairness

Built on Stacks L2, BitPredict combines Bitcoin's security with advanced smart contract capabilities for decentralized finance (DeFi) applications.

## Features

- 🛠️ Create customized prediction markets with configurable:
  - Start/end block heights
  - Initial reference price
  - Market duration
- 🔮 Participate in active markets with STX stakes
- ⚖️ Automated winner determination via price oracle
- 💸 Claim rewards proportional to stake size after resolution
- 📊 Transparent fee structure (2% platform fee)
- 🔒 Non-custodial design - funds held in smart contract

## Smart Contract Details

### Key Components

| Component               | Description                                  |
|-------------------------|----------------------------------------------|
| `markets`               | Stores all market data and stake allocations|
| `user-predictions`      | Tracks individual user positions            |
| `oracle-address`        | Approved price feed provider                 |
| `minimum-stake`         | 1 STX minimum participation                 |
| `fee-percentage`        | 2% protocol fee on winnings                 |

### Core Functions

| Function                | Description                                  |
|-------------------------|----------------------------------------------|
| `create-market`         | (Admin) Initialize new prediction market    |
| `make-prediction`       | Stake STX on market outcome                 |
| `resolve-market`        | (Oracle) Finalize market with end price     |
| `claim-winnings`        | Withdraw rewards for correct predictions    |
| `get-market`            | View market details                         |

## Installation

### Prerequisites

- [Node.js](https://nodejs.org/) v16+
- [Clarinet](https://docs.hiro.so/clarinet)
- [Hiro Wallet](https://wallet.hiro.so/)

### Local Development

1. Clone repository:

   ```bash
   git clone https://github.com/your-org/bitpredict.git
   cd bitpredict
   ```

2. Install dependencies:

   ```bash
   npm install
   ```

3. Start local DevNet:

   ```bash
   clarinet integrate
   ```

## Usage

### Creating a Market (Admin)

```typescript
// Create 100-block market starting at $30k BTC
clarinet contract call bitpredict create-market \
  --args u30000000 u650 u750 \
  --sender ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM
```

### Making a Prediction

```typescript
// Stake 5 STX on "Up" in market 0
clarinet contract call bitpredict make-prediction \
  --args u0 \"up\" u5000000 \
  --sender ST2NEB84ASENDXKYGJPQW86YXQ3FHS2NJQDS24BWT
```

### Resolving Market (Oracle)

```typescript
// Finalize market 0 with $32.5k BTC price
clarinet contract call bitpredict resolve-market \
  --args u0 u32500000 \
  --sender ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM
```

### Claiming Winnings

```typescript
// Claim rewards from market 0
clarinet contract call bitpredict claim-winnings \
  --args u0 \
  --sender ST2NEB84ASENDXKYGJPQW86YXQ3FHS2NJQDS24BWT
```

## View Contract State

### Get Market Details

```typescript
clarinet contract get-data bitpredict get-market u0
```

### Check User Position

```typescript
clarinet contract get-data bitpredict get-user-prediction u0 ST2NEB84ASENDXKYGJPQW86YXQ3FHS2NJQDS24BWT
```

## Admin Functions

| Function                | Description                                  |
|-------------------------|----------------------------------------------|
| `set-oracle-address`    | Update price feed provider                   |
| `set-minimum-stake`     | Adjust minimum participation amount          |
| `set-fee-percentage`    | Modify protocol fee (max 100%)               |
| `withdraw-fees`         | Collect accumulated protocol fees            |

## Testing

Run comprehensive test suite:

```bash
npm test
```

## Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

## Resources

- [Stacks Documentation](https://docs.stacks.co/)
- [Clarity Language Reference](https://docs.stacks.co/docs/clarity/)
- [Hiro Developer Portal](https://dev.hiro.so/)

---

**Disclaimer**: This software is experimental. Use at your own risk.
