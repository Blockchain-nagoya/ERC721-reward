pragma solidity 0.4.24;


contract Sponsor {

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