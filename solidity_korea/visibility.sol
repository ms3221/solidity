// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.3;

// visibility 
// private - only inside contract 
// internal - only inside contract and child contracts 
// public - inside and outside contract
// external only from outside contract 

 
 contract A {
     function pub() external  pure returns (uint){
         return 1;
     }

     function B() public  pure returns(uint){
         return this.pub();
     }
    
 }

 contract B is A{
     function pubTest() external pure returns(uint){
       return pub();
     }
 }
