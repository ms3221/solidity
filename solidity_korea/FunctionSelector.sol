
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FunctionSelector{
    function getSelector(string calldata _func) external pure returns(bytes4){
        return bytes4(keccak256(bytes(_func)));
    }
}
//0x8a4068dd
contract Receiver{ 
    event Log(bytes data);
    function transfer(address _to, uint _amount) external {
      emit Log(msg.data);
      //0xa9059cbb 호출할 함수를 인코딩 
      //000000000000000000000000ab8483f64d9c6d1ecf9b849ae677dd3315835cb2 address
      //000000000000000000000000000000000000000000000000000000000000007b amount
    }
}
0xa9059cbb000000000000000000000000b098ae7ddc405a6a6f891693e00c8b9895e1a93f0000000000000000000000000000000000000000000000000000000000000064