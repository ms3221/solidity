// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Order of inheritance - most base - like to derived

/*
      X
    / |
   Y  |
    \ |
      Z   
*/
// Z contract는 Y, X contract를 상속받는다. 
// order of most base like to derived 
// X, Y, Z


/*
     
     X
   /   \
  Y     A
  |     |
  |     B
   \   /
     Z 

 X, Y, A, B, Z    
*/


contract X {
    function foo() public pure virtual returns(string memory){
        return "X";
    }
    function bar() public pure virtual returns(string memory){
        return "X";
    }
    function x() public pure returns(string memory){
        return "X";
    }
}


contract Y is X {
    function foo() public pure virtual override returns(string memory){
        return "Y";
    }
    function bar() public pure virtual override returns(string memory){
        return "Y";
    }
    function y() public pure returns(string memory){
        return "Y";
    }
}


//상속은 baseline부터 해야한다.

contract Z is X,Y{
    function foo() public pure override(X,Y) returns(string memory){
        return "Z";
    }

    function bar() public pure override(X,Y) returns(string memory){
        return "Z";
    }
}