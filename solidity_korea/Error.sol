// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


//require, revert, assert
// gas refund, state updates are reverted
// custom error - save gas 

contract Error {
     function testRequire(uint _i) public pure{
         require(_i < 10, "i > 10");
     }


//revert는 검사할 조건이 많은 if문에 중첩되어 있는 경우에 더 나은 옵션이 될수가 있다. 
     function testRevert(uint _i) public pure {
         if(_i > 10){
             if(_i > 2){
                 if(_i > 10){
                   revert("i>10");
                 }
             }
           
         }
     }

   uint public num = 123;
   function testAssert() public view {
       assert(num == 123);
   }

   function foo() public {
       num++;
   }

  //사용자 지정 에러를 사용하는이유는 메세지가 길면길수록  require보다 저렴하다는 것이다.
    error MyError(address caller, uint i);
     function testCustomerError(uint _i) public view {
         if(_i > 10){
             revert MyError(msg.sender, _i);
         }
     }

}