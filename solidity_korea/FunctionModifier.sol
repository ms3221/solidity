// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


contract FunctionModifier {

    //Basic, input, sandWich 

   bool public paused;
   uint public count;

   modifier whenNotPause(){
       require(!paused, "pasued");
       _;
   }

   function setPasue(bool _paused) external {
       paused = _paused;
   }

   function inc() external whenNotPause{
       count += 1;
   }

   function dec() external whenNotPause{
       count -= 1;
   }
   modifier cap(uint _x){
       require(_x <100, "x >= 100");
       _;
   }

   function incBy(uint _x) external whenNotPause cap(_x){
       require(_x<100, "x>= 100");
       count += _x;
   }

   modifier sandwich() {
       count += 10;
       _;
       count *= 2;
   }
   function foo() external sandwich {
       count += 1;
   }
}