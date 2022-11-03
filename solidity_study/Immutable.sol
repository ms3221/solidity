// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.3;


contract Immutable {
    address public immutable owner = msg.sender;
    }