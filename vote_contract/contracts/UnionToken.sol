

/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import '../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol';
import '../node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol';
import '../node_modules/@openzeppelin/contracts/token/ERC20/extensions/ERC20Snapshot.sol';
import '../node_modules/@openzeppelin/contracts/access/Ownable.sol';



contract UnionToken is ERC20, Ownable {

    constructor(string memory name, string memory symbol) ERC20(name,symbol) {

    }

    function mintToken(address to, uint256 amount) public returns (bool){

        require(to != address(0x0));
        require(amount > 0);
        _mint(to, amount);
        //_approve(to, msg.sender, allowance(to, msg.sender) + amount);
        return true;

    }

   
}