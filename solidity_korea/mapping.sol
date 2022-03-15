// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


// Mapping 
// How to declare a mapping (simple and nested);
// Set, get, delete

contract Mapping {
    mapping(address => uint) public balances;
    mapping (address => mapping(address => bool)) public isFriend;

    function examples() external {
         balances[msg.sender] = 123;
        uint bal =  balances[msg.sender];
        uint bal2 =  balances[address(1)]; // 0
        
        balances[msg.sender] += 456;  // 123 + 456;

        delete balances[msg.sender]; // delete는 기본값을로 변환시킨다. 고로 0이된다.
         

         isFriend[msg.sender][address(this)] = true;
    }
}