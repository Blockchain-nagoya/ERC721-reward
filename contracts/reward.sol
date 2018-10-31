pragma solidity 0.4.24;

import "./Mint.sol";
import "./Sponsor.sol";

contract reward is Mint, Sponsor {

  constructor() public ERC721Full("Blockchain-Nagoya", "BCN") {}

}
