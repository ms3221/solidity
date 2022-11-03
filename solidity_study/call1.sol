///SPDX -Licenses-Identifier : GPL-3.0

pragma solidity >= 0.5.0 < 0.9.0;

contract TestCall{
    string public message;
    uint public x;

    event Log(string message);

    fallback() external payable {
        emit Log("fallback was called");
    }
    function foo(string memory _message, uint _x) external payable returns(bool,uint){
        message = _message;
        x = _x;
        return(true,999);
    }
}

contract Call {
    bytes public data;
    function callFoo(address payable _test) external payable {
      (bool success, bytes memory _data) = _test.call(abi.encodeWithSignature("foo(string,uint)","call foo",123));
      require(success,"call failed");
     data = _data;
    }

    function callDoseNotExit(address _test) external {
        (bool success, ) = _test.call(abi.encodeWithSignature("doesNotExist()"));
        require(success,"call failed");
    }

    function test(address payable _addr) external returns(uint){
        (bool success, uint  _data) = TestCall(_addr).foo("call foo",123);
         return _data;
    }
    
}