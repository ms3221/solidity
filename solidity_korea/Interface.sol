// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.3;


interface ICounter {
 function count() external view returns(uint);
 function inc() external;
 function dec() external;
}

contract CallInterface{
    uint public count;
    function examples(address _counter) external {
        ICounter(_counter).inc();
        count = ICounter(_counter).count();
    }
}


contract Counter{
    uint public count;
    function inc() external {
        count += 1;
    }
    function dec() external {
        count -= 1;
    }
}