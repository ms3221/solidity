// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


contract Constructor {
    address public owner; //default address(0)
    uint public x;  //default 0
    

    //우리는 생성자를 통해서 owner, x값을 초기화 시킬 수 있습니다. 
    constructor(uint _x) {
        owner = msg.sender;
        x = _x;
    }
}

contract Ownable {
    address public owner;
    constructor () {
        owner = msg.sender;
    }

    //컨트랙을 배포한 계정만 함수를 사용할수 있는 모디파이어
    modifier onlyOwner() {
        require(msg.sender == owner, "caller is not owner");
        _;
    }
    
    //컨트랙트 배포 계정이 소유자를 바꿔주는 함수 
    function setOwner(address _newOwner) external onlyOwner {
        require(_newOwner != address(0), "invalid address");
        owner = _newOwner;
    }
}