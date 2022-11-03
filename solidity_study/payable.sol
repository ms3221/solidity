//SPDX -Licenses-Identifier : GPL-3.0

pragma solidity >= 0.5.0 < 0.9.0;

contract Payable {
    event howMuch(uint256 _value);
    function sendNow(address payable _to) public payable {
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send either");
        emit howMuch(msg.value);
    }

    function transferNow(address payable _to) public payable {
        _to.transfer(msg.value);
        emit howMuch(msg.value);
    }

    function callNow (address payable _to) public payable {

       //(bool sent, ) = _to.call.gas(1000).value(msg.value)("");

        (bool sent,) = _to.call{value:msg.value}("");
        require(sent, "Failed to send Ether");
        emit howMuch(msg.value);
    }
}