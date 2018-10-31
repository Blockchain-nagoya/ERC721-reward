pragma solidity 0.4.24;

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract Sponsor is Ownable {

  uint256 private ContractBalance;

  function pay() payable public {
    require(msg.value > 0);

    ContractBalance += msg.value;
  }

  function withdraw() public onlyOwner {
    uint256 _value = ContractBalance;
    ContractBalance -= ContractBalance;

    owner.transfer(_value);
  }

  function viewBalance() public returns(uint256) {
    return ContractBalance;
  }

}