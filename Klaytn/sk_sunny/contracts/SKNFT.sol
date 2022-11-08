// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import "@klaytn/contracts/KIP/token/KIP17/extensions/KIP17URIStorage.sol";
import "@klaytn/contracts/access/Ownable.sol";
import "@klaytn/contracts/utils/Counters.sol";

contract SKNFT is KIP17URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    mapping(address => bool) whitelistedAddresses;
    bool public permission;

    constructor() public KIP17("SKUNK", "SK") {}

    modifier isWhitelisted() {
        require(whitelistedAddresses[msg.sender], "You need to be whitelisted");
        _;
    }

    function changePermission() external onlyOwner {
        permission = !permission;
    }

    function addUser(address[] memory whitelist) public onlyOwner {
        for (uint256 i = 0; i < whitelist.length; i++) {
            require(!whitelistedAddresses[whitelist[i]], "check your list");
            whitelistedAddresses[whitelist[i]] = true;
        }
    }

    function verifyUser(address _whitelistedAddress)
        public
        view
        returns (bool)
    {
        return whitelistedAddresses[_whitelistedAddress];
    }

    function mintNFT(address to, string memory tokenURI)
        public
        isWhitelisted
        returns (uint256)
    {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _safeMint(to, newItemId);
        _setTokenURI(newItemId, tokenURI);
        return newItemId;
    }

    //NFT전송에서 권한을 ON / OFF 하기위해서 override해서 require문을 추가해 줬다 
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual override {
      require(permission,"owner is not allow to send NFT");
      require(_isApprovedOrOwner(_msgSender(), tokenId), "KIP17: transfer caller is not owner nor approved");
        _transfer(from, to, tokenId);
    }

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual override {
        require(permission,"owner is not allow to send NFT");
        safeTransferFrom(from, to, tokenId, "");
    }
}
