


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


contract Event{
    event Log(string message, uint indexed val);
    event IndexedLog(address indexed sender,uint val);


    function example(string calldata _text,uint _val) external {
        emit Log(_text,_val);
        emit IndexedLog(msg.sender,789);
    }


}