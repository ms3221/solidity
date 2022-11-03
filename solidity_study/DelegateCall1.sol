//SPDX -Licenses-Identifier : GPL-3.0

pragma solidity >= 0.5.0 < 0.9.0;

contract TestDelegateCall{
    uint public num;
    address public sender;
    uint public value;
    address public owner;

    function setVars(uint _num) external payable{
        num = _num*3;
        sender = msg.sender;
        value = msg.value;
        owner = msg.sender;
    }

}

contract DelegateCall{
    uint public num;
    address public sender;
    uint public value;

    function setVars(address _test, uint _num) external payable {
     //(bool success, ) = _test.delegatecall(abi.encodeWithSignature("setVars(uint256)",_num));
     (bool success, bytes memory data ) = _test.delegatecall(
          abi.encodeWithSelector(TestDelegateCall.setVars.selector, _num)
     );
    }
}