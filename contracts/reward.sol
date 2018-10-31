pragma solidity 0.4.24;

import "./Mint.sol";

contract reward is Mint {

  constructor() public ERC721Full("Blockchain-Nagoya", "BCN") {}

}
