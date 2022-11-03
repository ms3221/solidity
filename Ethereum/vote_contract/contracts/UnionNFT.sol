/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../node_modules/@openzeppelin/contracts/access/Ownable.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "../node_modules/@openzeppelin/contracts/utils/Counters.sol";
import "./owner/Role.sol";

contract UnionNFT is ERC721URIStorage, Role {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    mapping(string => address) public userClaim;

    constructor(string memory unionName, address[] memory _owners)
        ERC721(unionName, unionName)
        Role(_owners)
    {}

    /*
  votePower가 담긴 NFT를 mint해주는 기능 엔젤리그 계정만 가능 
  @param tokenURI  ipfs hash값 
  @dev  NFT 발행 
  @return tokenId
   */
    function mintNFT(string memory tokenURI) external returns (uint256) {
        require(userClaim[tokenURI] == msg.sender, "user do not have right");
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        return newItemId;
    }

    /*
       미리 userList와 ipfsList를 mapping 시키는 함수  엔젤리그 계정만 가능 
       @param userList address배열로 해당되는 조합의 user주소가 담긴 배열
       @param ipfsList string배열로 해당되는 조합의 ipfs hash값이 담긴 배열
       @dev userClaim mapping에 key:ipfsHash value:account 저장
     */

    function setUserList(address[] memory userList, string[] memory ipfsList)
        external
        unionFactoryRole(msg.sender)
    {
        require(userList.length != 0 && ipfsList.length != 0, " zero array");
        require(userList.length == ipfsList.length, "not same length");
        for (uint256 i = 0; i < userList.length; i++) {
            userClaim[ipfsList[i]] = userList[i];
        }
    }
}
