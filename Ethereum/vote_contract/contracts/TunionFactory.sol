/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Tunion.sol";

contract UnionFactory {
    Union[] public unions;
 
    string[] public unionNames;
    mapping(string => address) findUnionAddress;
    mapping(address => bool)public isOwner;
    address[] public owners;

    constructor(address[] memory _owners) {
        require(_owners.length > 0, "owners required");
      for(uint i; i<_owners.length; i++){
          address owner = _owners[i];
          require(owner != address(0),"invalid owner");
          require(!isOwner[owner], "owner is not unique");
          isOwner[owner] = true;
          owners.push(owner);
      }
    }

    modifier onlyOwner(){
       require(isOwner[msg.sender],"not owner");
       _;
   }

    function createUnion(string memory unionName) external onlyOwner {
        
        Union singleUnion = new Union(unionName, owners);
     
        findUnionAddress[unionName] = address(singleUnion);
        unionNames.push(unionName);
        unions.push(singleUnion);
    }

    /*
      unionName을입력하면 해당하는 contractAddress를 알 수 있는 함수. 
    */
    function getCAddress(string memory unionName)
        external
        view
        onlyOwner
        returns (address unionAddress)
    {
        unionAddress = findUnionAddress[unionName];
    }
    function getTotalUnionName() external view returns(string[] memory result){
        result = unionNames;
    }
}

