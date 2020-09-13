const HDWalletProvider = require('@truffle/hdwallet-provider');
require('dotenv').config()

module.exports = {
  networks: {
    development: {
      protocol: 'http',
      host: 'localhost',
      port: 7545,
      gas: 5000000,
      gasPrice: 5e9,
      networkId: '*',
    },
    rinkeby: {
      provider: () => new HDWalletProvider(
        process.env.PRIVATE_KEY,
        `https://rinkeby.infura.io/v3/` + process.env.INFURA_ID
      ),
      networkId: 4,
      gasPrice: 10e9
    },
    bscqa: {
      provider: () => new HDWalletProvider(
        process.env.PRIVATE_KEY,
        'https://data-seed-prebsc-1-s1.binance.org:8545'
      ),
      networkId: 97,
      gasPrice: 10e9
    },
    bsc: {
      provider: () => new HDWalletProvider(
        process.env.PRIVATE_KEY,
        'https://bsc-dataseed1.binance.org/'
      ),
      networkId: 56,
      gasPrice: 10e9
    },
    mainnet: {
      provider: () => new HDWalletProvider(
        process.env.PRIVATE_KEY,
        `https://mainnet.infura.io/v3/` + process.env.INFURA_ID
      ),
      networkId: 1,
      gasPrice: 130e9
    }
  },
};
