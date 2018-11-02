pragma solidity 0.4.24;

import "openzeppelin-solidity/contracts/token/ERC721/ERC721Metadata.sol";

contract Meta is ERC721Metadata {

  function changeURI(uint256 _tokenId, string _URI) public {
    _setTokenURI(_tokenId, _URI);
  }
  
}