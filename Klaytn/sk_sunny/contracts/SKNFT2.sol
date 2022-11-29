// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import "../node_modules/@klaytn/contracts/KIP/token/KIP17/extensions/KIP17URIStorage.sol";
import "../node_modules/@klaytn/contracts/access/Ownable.sol";
import "../node_modules/@klaytn/contracts/utils/Counters.sol";

library SafeMath {
   function calculateBadge(uint256 badge) internal pure returns(uint256){
       return badge/2;
   }
}

contract SKNFT2 is KIP17URIStorage, Ownable {
    using SafeMath for uint256;
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    struct Member{
        bool whitelisted;
        uint256 badage;
    }
    Member public member;
    Member[] public members;
    mapping(address => Member) public memberByOwner;
    bool public permission;

    constructor() public KIP17("SKUNK2", "SK2") {}

     modifier isWhitelisted(address to) {
        Member memory user = memberByOwner[to];
        require(user.whitelisted, "You are not whitelisted");
        _;
    }

    function handleTransferFrom() external onlyOwner {
        permission = !permission;
    }

    function addWhiteList(address[] memory whitelist, uint256[] calldata badge) public onlyOwner {

        for (uint256 i = 0; i < whitelist.length; i++) {
            Member storage user = memberByOwner[whitelist[i]];
            require(!user.whitelisted, "check your list");
            user.badage = badge[i];
            user.whitelisted = true;
        }
    }

    function updateBadge(address to,uint256 badge) external onlyOwner {
        Member storage user = memberByOwner[to];
        user.badage = badge;
    }

     function handleWhiteList(address to) external onlyOwner {
        Member storage user = memberByOwner[to];
        user.whitelisted = !user.whitelisted;
    }

    function verifyUser(address _whitelistedAddress)
        public
        view
        returns (Member memory)
    {
         Member memory user = memberByOwner[_whitelistedAddress];
        return user;
    }

    function mintNFT(address to, uint tokenId, string memory tokenURI)
        public
        isWhitelisted(to)
        returns (uint256)
    {
<<<<<<< HEAD
      // badge 4개면 nft총량은 2개
      // badge 3개면 nft총량은 1개
       if(balanceOf(to) != 0){
         uint256 allowNum = SafeMath.calculateBadge(badge);
         require(allowNum > balanceOf(to), "badge < balance");
        }
=======
          Member memory user = memberByOwner[to];
          uint256 bal = balanceOf(to);
          uint256 badge = user.badage;
          if(bal>0){
            require(badge/2 > bal || badge/2 - bal >= 1, 'badge < bal or 0.5< badge < 1');
          }
>>>>>>> 21bb0aaf062de7111719b94029007b057aae08eb
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, tokenURI);
        return tokenId;
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
