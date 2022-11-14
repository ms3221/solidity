// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.3;
import "./IERC20";
contract Vault {
    IERC20 public immutable token;

    uint public totalSupply;
    mapping(address => uint) public balaceOf;

    constructor(address _token){
       token = IERC20(_token);
    }

    function _mint(address _to, uint _amount) private {
        totalSupply += _amount;
        balaceOf[_to] += _amount;
    }

   function _burn(address _to, uint _amount) private {
        totalSupply -= _amount;
        balaceOf[_to] -= _amount;
    }

    function deposit(uint _amount) exteranl {
        /**
          a = amount
          B = balance of token before deposit
          T = total supply
          s = shares to mint 

          (T + s) / T = (a+B) / B
          s = aT / B 
         */

         uint shares;
         if(totalSupply == 0){
            shares = amount;
         }else {
            shares =(_amount * totalSupply) / token.balaceOf(address(this));
         }

         _mint(msg.sender, shares);
         token.transferFrom(msg.sender, address(this), _amount);
    }

    function withdraw(uint _shares) external {
         /**
          a = amount
          B = balance of token before deposit
          T = total supply
          s = shares to mint 

          (T - s) / T = (B-a) / B
          a = sB / T 
         */
         uint amount = _shares * token.balaceOf(address(this)) / totalSupply;
         _burn(msg.sender, _shares);
         token.transferFrom(msg.sender, amount);
    }

    
}