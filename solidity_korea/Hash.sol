// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;


/*
  abi.encode vs abi.encodePacked 차이는 무엇일까요?
  encode는 data를 bytes로 변환 시켜준다 그래서 000000000000000121212000000333333이런식으로 크기가 큰데 
  encodePakced를 사용하게되면 121212333333 압축해줍니다! 요것이 차이 


  또 keccak256 해쉬를 사용하더라도 결과 값이 같은 이유는 
  encodePacked에 ("AAAA","BBBB") ("AAA","ABBB") 와 똑같은 결과가 나오기 때문에 
  해쉬함수를 돌려도 같은 값이 나오게 됩니다. 

  만약 여기서 중간 uint x 변수하나를 더집어넣서 돌리게 되면 어떻게 될까요? 
  그렇면 ("AAAA",123,"BBBB")  ("AAA",123,"ABBB") 이 인자들은 다른 결과를 가지게 됩니다. 
  이게 왜그런지에 대해서는 물어봐야 할 것같습니다~~ 
  
*/
contract HashFunc {
    function hash(string memory text, uint num, address addr)external pure returns(bytes32){
        return keccak256(abi.encodePacked(text,num,addr));
    }
   function encode(string memory text0,string memory text1) external pure returns(bytes memory){
       return abi.encode(text0,text1);
   }
   function encodepacked(string memory text0,uint x,string memory text1) external pure returns(bytes memory){
       return abi.encodePacked(text0,x,text1);
   }
    function collsion(string memory text0, string memory text1) external pure returns(bytes32){
        return keccak256(abi.encodePacked(text0, text1));
    }
}