// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Test{
    string say = "hello";
    
    function sayHello() external view returns(string memory){
        return say;
    }
} 