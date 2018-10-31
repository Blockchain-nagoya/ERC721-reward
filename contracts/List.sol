pragma solidity 0.4.24;

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract List is Ownable {

  struct Reward {
    uint8 chapter;
    uint32 totalSupply;
    uint8 premium;
    uint32 issued;
    uint8 p_issued;
    uint32 timestamp;
    string URI;
    bool sale;
  }

  Reward[] internal RewardList;

  function setToken(uint256 _totalSupply, uint256 _premium, string _URI) public onlyOwner {

    RewardList.push(Reward(
      uint8(RewardList.length + 1),
      uint32(_totalSupply),
      uint8(_premium),
      uint32(0),
      uint8(0),
      uint32(now),
      _URI,
      true
    ));

  }

  function viewToken(uint _index) public view returns(uint256, uint256, uint256, uint256, uint256, uint256, string) {
    return(
      uint256(RewardList[_index].chapter),
      uint256(RewardList[_index].totalSupply),
      uint256(RewardList[_index].premium),
      uint256(RewardList[_index].issued),
      uint256(RewardList[_index].p_issued),
      uint256(RewardList[_index].timestamp),
      RewardList[_index].URI
    );
  }

}