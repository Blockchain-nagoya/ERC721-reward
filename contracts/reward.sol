pragma solidity 0.4.24;

import "./Mint.sol";
import "./Sponsor.sol";

contract reward is Mint, Sponsor {

  constructor(string _name, string _symbol) public ERC721Full(_name, _symbol) {}

}
