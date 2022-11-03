


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


contract Storage{

   //구조체를 선언할께요
   struct MyStruct {
       uint foo;
       string text;       
   }

   mapping(address=>MyStruct) myStructs;

   function examples(uint[] memory y, string memory s) external returns(uint[] memory){
    myStructs[msg.sender] = MyStruct({foo:123,text:"hello"});
    MyStruct storage myStruct = myStructs[msg.sender];
    myStruct.text ="no hello";

    //   MyStruct memory readOnly = myStructs[msg.sender];
    //   readOnly.foo = 456;

    //   return readOnly;

    uint[] memory menArr = new uint[](3);
    menArr[0] = 123;

    return menArr;

   }

   function readOnlys(address addr) external view returns(MyStruct memory){
       return myStructs[addr];
   }

}