pragma solidity ^0.5.0;

import "openzeppelin-solidity/contracts/token/ERC721/ERC721Full.sol";
import "openzeppelin-solidity/contracts/token/ERC721/ERC721MetadataMintable.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "./Utility.sol";
import "./MemberCard.sol";

contract Membership is Ownable, ERC721Full, ERC721MetadataMintable, MemberCard, Utility {

  constructor(string memory _name, string memory _symbol, string memory _url) public ERC721Full(_name, _symbol) {
    link = _url; // "https://membership.blockchain-nagoya.com/"
  }

  uint256 private memberCount;

  string private link;

  event LogMintMembership(address indexed minter, uint256 id);
  
  function mintMembership() public IsAddress {
    uint256 id = 1e6 + memberCount;
    memberCount++;

    string memory stringId = uintToString(id);
    string memory tokenURI = twoStrConnect(link, stringId);

    mintWithTokenURI(msg.sender, id, tokenURI);
    issueMemberCard(id);

    emit LogMintMembership(msg.sender, id);
  }

  function setlink(string memory _link) public onlyOwner {
    link = _link;
  }

  function getlink() public view onlyOwner returns(string memory) {
    return link;
  }

  function getMemberCount() public view onlyOwner returns(uint256) {
    return memberCount;
  }
}