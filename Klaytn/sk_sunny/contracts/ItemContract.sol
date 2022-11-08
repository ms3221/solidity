// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import "@klaytn/contracts/KIP/token/KIP17/extensions/KIP17URIStorage.sol";
import "@klaytn/contracts/KIP/token/KIP17/IKIP17.sol";
import "@klaytn/contracts/access/Ownable.sol";
import "@klaytn/contracts/utils/Counters.sol";

contract ItemContract is KIP17URIStorage, Ownable{
    KIP17 immutable SKUNK;
    // 내가 생각해야하는 부분기존의 NFT를 tokenId가 있는지 확인하는 함수를 만들자. 
    constructor(address _SKUNK) public KIP17("itemSKUNK", "ISK"){
     SKUNK = KIP17(_SKUNK);
   }

    modifier tokenExists(uint256 tokenId) {
        require(_exists(tokenId), "Token does not exist.");
        _;
    }

    function sendLostDoodleHome(address to, uint256 tokenId) external{
       if (!_exists(tokenId) || ownerOf(tokenId) == address(this)) {
            // doodle stuck in this contract
            SKUNK.safeTransferFrom(address(this), to, tokenId);
        } else if (ownerOf(tokenId) == address(SKUNK)) {
            // space doodle stuck in doodle contract
            _safeTransfer(address(SKUNK), to, tokenId, "");
        } else {
            revert("Only allowed in rescue scenarios.");
        }
    }
    
}