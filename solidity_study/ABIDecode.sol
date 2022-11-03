// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.3;


contract ABIDcode{

    struct MyStruct{
        string name;
        uint[2] nums;
    }
    function encode(
        uint x,
        address addr,
        uint[] calldata arr,
        MyStruct calldata myStruct
    ) external pure returns(bytes memory){
        return abi.encode(x, addr, arr, myStruct);
    }
    function decode(bytes calldata data) external pure returns(
        uint x,
        address addr,
        uint[] memory arr,
        MyStruct memory myStruct
    ){
        (x, addr, arr, myStruct) = abi.decode(data,(uint, address, uint[], MyStruct)); 
    } 
}


contract pratice {
    function encode(string memory x)external pure returns(bytes memory){
        return abi.encode(x);
    }
    function decode(bytes calldata data) external pure returns (string memory x){
         x = abi.decode(data,(string));
    }
}