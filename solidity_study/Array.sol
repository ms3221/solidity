// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//Array - dynamic or fixed size
// Initialization
// Insert(push), get, update, delete, pop length
//Creating array in memory
// Returning array from function 

contract Array {
    uint[] public nums = [1,2,3];
    uint[3] public numsFixed = [1,2,3];
    uint[] public Arr;

    function examples() external {
        nums.push(4);  //[1,2,3,4]
        uint x = nums[1];
        nums[2] = 777; // [1,2, 777, 4]
        delete nums[1]; // [1, 0, 777, 4]
        nums.pop(); // [1,0,777]
        uint len = nums.length;

        //create array in memory
        uint[] memory a = new uint[](5);
        //a.pop();
        //a.push();
        a[0] = 1;
    } 

    function returnArray(uint[] memory b) external pure returns (uint[] memory){
        uint[] memory a = new uint[](b.length);
        //a.pop();
        //a.push();
        for(uint i=0; i<b.length; i++){
            a[i] = b[i];
        }
        return a;
    }

    function test() external returns(uint[] memory){
         
     uint[] memory Brr = new uint[](1);
    
     Brr[0] = 1;
     return Brr;
    }

}