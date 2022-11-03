// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;



//Return multiple outputs
// Named outputs
// Destructuring Assignment

contract FunctionOutputs {


    //multiple outputs;
    function returnMany() public pure returns(uint, bool) {
        return(1,true);
    }
    //변수명으로 출력
    function named() public pure returns(uint x, bool b) {
        return(1,true);
    }

   //이러한 방법은 가스비를 조금 아낄수 있다. 
    function assigned() public pure returns(uint x, bool b) {
        x = 1;
        b = true;
    }


// Destructuring Assignment
   function destructingAssigments() public pure {
       (uint x,bool b) = returnMany();
       (,bool _b) = returnMany();
   }
}