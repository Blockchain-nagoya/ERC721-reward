pragma solidity 0.4.24;

import "openzeppelin-solidity/contracts/token/ERC721/ERC721Full.sol";
import "openzeppelin-solidity/contracts/token/ERC721/ERC721MetadataMintable.sol";
import "./List.sol";

contract Mint is List, ERC721Full, ERC721MetadataMintable {

  // address => chapter => bool
  mapping (address => mapping(uint256 => bool)) private chapterToAddress;

  modifier checkToken() {
    require(chapterToAddress[msg.sender][RewardList.length] != true);
    _;
  }


  // _setTokenURI(tokenId, tokenURI)


  function mint(string _URI) public checkToken {
    require(RewardList[RewardList.length - 1].sale == true);

    uint256 _index = RewardList.length - 1;
    uint256 _chapter = RewardList.length;

    if(RewardList[_index].issued < RewardList[_index].totalSupply) {

      uint256 _TokenId = tokenId();
      RewardList[_index].issued++;
      chapterToAddress[msg.sender][_chapter] = true;
      mintWithTokenURI(msg.sender, _TokenId, _URI);

    } else {
      RewardList[_index].sale = false;
    }
  }

  function premiumMint(string _URI) payable public checkToken {
    require(
      RewardList[RewardList.length - 1].sale == true &&
      RewardList[RewardList.length -1].p_issued < RewardList[RewardList.length -1].premium &&
      msg.value > 0
    );

    uint256 _index = RewardList.length - 1;
    uint256 _chapter = RewardList.length;

    if(RewardList[_index].p_issued < RewardList[_index].premium) {

      uint256 _TokenId = premiumTokenId();
      RewardList[_index].p_issued++;
      RewardList[_index].issued++;
      chapterToAddress[msg.sender][_chapter] = true;
  
      mintWithTokenURI(msg.sender, _TokenId, _URI);

    } else {
      msg.sender.transfer(msg.value);

      if(RewardList[_index].issued == RewardList[_index].totalSupply) {
        RewardList[_index].sale = false;
      }
    }
  }

  function tokenId() private view returns(uint256) {
    uint256 index = RewardList.length - 1;

    uint256 chapter = uint256(RewardList[index].chapter);
    uint256 number = uint256(
      RewardList[index].premium + (RewardList[index].issued - RewardList[index].p_issued)
    );
    return chapter * 100 + number;
  }

  function premiumTokenId() private view returns(uint256) {
    uint256 _index = RewardList.length - 1;

    uint256 chapter = uint256(RewardList[_index].chapter);
    uint256 number = RewardList[_index].p_issued;

    return chapter * 100 + number;
  }
}