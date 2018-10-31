pragma solidity 0.4.24;


contract MemberShip {

  struct Member {
    uint32 id;
    address addr;
    uint32 timestamp;
  }

  mapping (address => bool) private idToAddress;
  Member[] private MemberList;

  modifier idToAddress() {
    require(idToAddress[msg.sender] != true);
    _;
  }

  function issueMembership() public idToAddress {
    if( MemberList.length < 100 ) {
      uint256 _id = MemberList.length;
    } else {
      uint256 _id = 100000 + MemberList.length - 100;
    }

    MemberList.push(Member(
      uint32(_id), msg.sender, uint32(now)
    ));
    _mint(msg.sender, _id);
  }



}