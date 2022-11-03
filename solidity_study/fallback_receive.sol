//SPDX -Licenses-Identifier : GPL-3.0

pragma solidity >= 0.5.0 < 0.9.0;



contract Bank {
    event checkval(address _from, uint amount);
    event JustFallback(address _from, string message);
    event JustFallbackWithfunds(address _from, uint amount, string message);

    // fallback() external {
    //     emit JustFallback(msg.sender, "JustiFallback is called");
    // }
    // fallback() external payable {
    //     emit JustFallbackWithfunds(msg.sender, msg.value,"JustiFallback is called");
    // }

    receive () external payable {
        emit checkval(msg.sender, msg.value);
    }

}


contract You {
    function send(address payable to) public payable {
        bool sent = to.send(msg.value);
        require(sent, "Failed");
    }

    function JustGiveMessage(address _to) public {
        (bool success,) = _to.call("HI");
        require(success,"Failed");
    }

    function JustGiveMessageWithFunds(address payable _to) public payable {
        (bool success,) = _to.call{value:msg.value}("JI");
        require(success, "Failed");
    }
}