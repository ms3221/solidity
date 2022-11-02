
 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";


contract WATTONFT is ERC721URIStorage {  
       

      
        using Counters for Counters.Counter;
        Counters.Counter private _tokenIds;
        uint256 public nftPrice; // nft 가격을 정하기위해서 만들어논 상태변수

        constructor() ERC721("WATTONFTs", "WTNFT") {}   
    
        function mintNFT(string memory tokenURI) external returns (uint256) {
            
            _tokenIds.increment();
            uint256 newItemId = _tokenIds.current();
            _mint(msg.sender, newItemId);
            _setTokenURI(newItemId, tokenURI); 
            return newItemId;
        }

}