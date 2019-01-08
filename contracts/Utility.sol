pragma solidity ^0.5.0;

contract Utility {

  function twoStrConnect(string memory _str1, string memory _str2) internal view returns(string memory){
    string memory str1 = _str1;
    string memory str2 = _str2;
    bytes memory strbyte1 = bytes(str1);
    bytes memory strbyte2 = bytes(str2);

    bytes memory str = new bytes(strbyte1.length + strbyte2.length);

    uint8 point = 0;
    for(uint8 j = 0; j < strbyte1.length;j++){
      str[point] = strbyte1[j];
      point++;
    }
    for(uint8 k = 0; k < strbyte2.length;k++){
      str[point] = strbyte2[k];
      point++;
    }
    return string(str);
  }

  function threeStrConnect(string memory _str1, string memory _str2, string memory _str3) internal view returns(string memory) {
    string memory str1 = _str1;
    string memory str2 = _str2;
    string memory str3 = _str3;
    bytes memory strbyte1 = bytes(str1);
    bytes memory strbyte2 = bytes(str2);
    bytes memory strbyte3 = bytes(str3);

    bytes memory str = new bytes(strbyte1.length + strbyte2.length + strbyte3.length);

    uint8 point = 0;
    for(uint8 j = 0; j < strbyte1.length;j++){
      str[point] = strbyte1[j];
      point++;
    }
    for(uint8 k = 0; k < strbyte2.length;k++){
      str[point] = strbyte2[k];
      point++;
    }
    for(uint8 k = 0; k < strbyte3.length;k++){
      str[point] = strbyte3[k];
      point++;
    }
    return string(str);
  }

  function uintToBytes(uint v)view internal returns(bytes32 ret) {
    if (v == 0) {
      ret = '0';
    }
    else {
      while (v > 0) {
        ret = bytes32(uint(ret) / (2 ** 8));
        ret |= bytes32(((v % 10) + 48) * 2 ** (8 * 31));
        v /= 10;
      }
    }
    return ret;
  }
    
  function bytesToString(bytes memory _bytes) view internal returns(string memory) {
    bytes memory str = new bytes(_bytes.length);

    uint8 point = 0;
    for(uint8 j = 0; j < _bytes.length;j++){
      str[point] = _bytes[j];
      point++;
    }
    return string(str);
  }

  function uintToString(uint _uint) view internal returns(string memory) {
    bytes memory strBytes = abi.encodePacked(uintToBytes(_uint));
    return bytesToString(strBytes);
  }

}