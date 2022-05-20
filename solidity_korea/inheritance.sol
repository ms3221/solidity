// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;



contract A{
    function foo(string calldata _text)external pure virtual returns(string memory){
        return "A";
    }
    function bar() external pure virtual returns(string memory){
        return "A";
    }

    function baz() external pure returns(string memory){
        return "A";
    }
}


// 다시말해서 자시컨트랙트에서 부모컨트랙트를 상속받을 때 똑같은 함수명을 가지고 사용할 때 자식에서 override가 부모에서는 virtual이 필요하다.
// 하지만 함수명이 겹치지 않고 부모의 method를 사용할 경우에는 별다른 조치가 필요없이 가져다가 사용하면 된다. 
// 함수명도 동일해야하지만 parameter까지도 동일해야합니다. 
contract B is A{
    function foo()external pure  returns(string memory){
        return "B";
    }
    function bar() external pure virtual override returns(string memory){
        return "B";
    }
}


contract C is B{
      function bar() external pure virtual override returns(string memory){
        return "C";
    }
}