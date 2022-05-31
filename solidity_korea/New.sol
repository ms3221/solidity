// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Account {
    address public bank;
    address public owner;
    
    constructor(address _owner) payable {
        bank = msg.sender;
        owner = _owner;
    }
    function changeOwner(address _owner) external{
        owner = _owner;
    }

}


contract AccountFactory{
    Account[] public accounts;
    function creatAccount(address _owner) external payable {
      Account account = new Account{value:111}(_owner);
      accounts.push(account);
    }

    function chagneOwner(address _owner) external {
       (bool success,) =  _owner.call(abi.encodeWithSelector(Account.changeOwner.selector,_owner));
    }
}

