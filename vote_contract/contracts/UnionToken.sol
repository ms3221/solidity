/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC20/extensions/ERC20Snapshot.sol";
import "../node_modules/@openzeppelin/contracts/access/Ownable.sol";
import "./Union.sol";

contract UnionToken is ERC20, Ownable {
    address union;

    constructor(
        string memory name,
        string memory symbol,
        address _union
    ) ERC20(name, symbol) {
        union = _union;
    }

    function mintToken(address to, uint256 amount) public returns (bool) {
        require(to != address(0x0));
        require(amount > 0);
        _mint(to, amount);
        Union(union).setVotePower(to, amount);
        //_approve(to, msg.sender, allowance(to, msg.sender) + amount);
        return true;
    }
}
