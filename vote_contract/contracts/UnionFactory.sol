/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Union.sol";
import "./UnionNFT.sol";
import "./owner/Role.sol";

contract UnionFactory {
    Union[] public unions;
    UnionNFT[] public nfts;
    string[] public unionNames;
    mapping(string => address) findUnionAddress;
    mapping(string => address) findNFTAddress;

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function createUnion(string memory unionName) external {
        require(owner == msg.sender, "user is not owner");
        Union singleUnion = new Union(unionName, msg.sender);
        UnionNFT singleNFT = new UnionNFT(unionName, msg.sender);

        findUnionAddress[unionName] = address(singleUnion);
        findNFTAddress[unionName] = address(singleNFT);

        unionNames.push(unionName);
        nfts.push(singleNFT);
        unions.push(singleUnion);
    }

    /*
      unionName을입력하면 해당하는 contractAddress를 알 수 있는 함수. 
    */
    function getCAddress(string memory unionName)
        external
        view
        returns (address unionAddress, address unionTokenAddress)
    {
        require(owner == msg.sender, "user is not owner");
        unionAddress = findUnionAddress[unionName];
        unionTokenAddress = findNFTAddress[unionName];
    }
}
