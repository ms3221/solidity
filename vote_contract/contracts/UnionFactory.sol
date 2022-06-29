

   /// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './Union.sol';
import './UnionToken.sol'; 
import '../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol';



contract UnionFactory {

     Union[] public unions; 
     UnionToken[] public tokens;
     string[] public unionNames;
     mapping(string => address) findUnionAddress;
     mapping(string => address) findTokenAddress;

   /*
      각각 해당하는 union contract를 생성하는 함수 
      UnionFactory의 기능은 각 조합에 해당하는 컨트랙트를 만들어 주는 가장 큰 상위의 컨트랙트입니다.
      
      ----- 변수명 설명 ------ 
      unions -> 각각의 union Contract를 담을 수 있는 union 컨트랙트로 이루어진 배열객체
      findUnionAddress -> 조합이름을 가지고 컨트랙트 주소를 찾기 위한 mapping 

    */


   /*
     @param 
     unionName : 만들려고하는 조합의 이름 
   */
    function createUnion(string memory unionName,address chairperson)external {
        
        UnionToken singleToken = new UnionToken(unionName,"one");
        Union singleUnion = new Union(unionName,chairperson,address(singleToken));
        findUnionAddress[unionName] = address(singleUnion);
        findTokenAddress[unionName] = address(singleToken);
        unionNames.push(unionName);
        tokens.push(singleToken);
        unions.push(singleUnion);
    } 


function UionArray()external view returns(string[] memory){
  return unionNames;
}

    /*
     지금까지 몇개의 조합이 만들어져있는지 읽기위한 함수 
   */
    function totalUnionNumber()external view returns(uint num){
       num = unions.length;
    }  
    /*
      unionName을입력하면 해당하는 contractAddress를 알 수 있는 함수. 
    */
    function UnionAddress(string memory unionName) external view returns(address unionAddress){
        unionAddress = findUnionAddress[unionName];
    }
     function UnionTokenAddress(string memory unionName) external view returns(address unionTokenAddress){
        unionTokenAddress = findTokenAddress[unionName];
    }
    
}