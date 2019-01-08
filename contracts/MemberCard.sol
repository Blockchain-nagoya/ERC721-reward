pragma solidity ^0.5.0;

contract MemberCard {

  mapping(address => bool) private isAddress;
  mapping(address => uint256) private idToAddress;
  mapping(uint256 => address) private addressToId;

  modifier IsAddress() {
    require(isAddress[msg.sender] != true);
    _;
  }

  function issueMemberCard(uint256 _id) internal IsAddress {
    isAddress[msg.sender] = true;
    idToAddress[msg.sender] = _id;
    addressToId[_id] = msg.sender;
  }

  function getMyCard()public view returns(uint256) {
    return idToAddress[msg.sender];
  }

  function getMemberId(address _address) public view returns(uint256) {
    return idToAddress[_address];
  }

  function getMemberAddress(uint256 _id)public view returns(address) {
    return addressToId[_id];
  }
}