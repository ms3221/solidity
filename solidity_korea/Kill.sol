/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// selfdestruct
// - delete contract 
// - force send Ether to any address
/*
  Helper라는 contract에서 call방식으로 Kill contract에 있는 selfdestruct라는 함수를 호출하게 되면 
  Kill contract가 죽기전에 가지고 있는 ether를 Helper contract로 전부 보내게 됩니다! 
  selfdestruct(address) 함수는 컨트랙트를 블록체인에서 지워버리기 전에 들어가는 param 인자인 주소에 남은 ether를 전부 보내고 contract를 삭제해버린다! 
*/

contract Kill {
    constructor ()payable{}
    function kill() external {
        selfdestruct(payable(msg.sender));
    }

    function testCall() external pure returns(uint){
        return 123;
    }
}

contract Helper {
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
    function kill(Kill _kill) external {
        _kill.kill();
    }
}