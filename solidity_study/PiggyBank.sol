/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract PiggyBank {
    event Deposit(uint amount);
    event Withdraw(uint amount);
    address public owner = msg.sender;

    receive() external payable {
     emit Deposit(msg.value);
    }

    function withdraw(address _address) external {
     require(msg.sender == owner,"caller is not owner");
     emit Withdraw(address(this).balance);
     selfdestruct(payable(_address));
    }
}