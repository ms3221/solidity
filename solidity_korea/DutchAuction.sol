// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;



interface IERC721 {
    function transferFrom(
        address _from,
        address _to,
        uint _nftId
    )external;
}

/*
더치옥션 시간이 지남에 따라서 가격이 인하되고 
구매자가 인하된 가격이 마음에 들 때 구매를 하게 되는 방식 

immutable값은 constructor에서 설정해주어야 합니다.
*/

contract DutchAuction{
  uint private constant DURATION = 7 days;

  IERC721 public immutable nft;
  uint public immutable nftId;

  address public immutable seller;
  uint public immutable startingPrice;
  uint public immutable startAt;
  uint public immutable expireAt;
  uint public immutable discountRate;


  constructor(    
      uint _startingPrice,
      uint _discountRate,
      address _nft,
      uint _nftId
      ){
  
      seller = payable(msg.sender);
      startingPrice = _startingPrice;
      discountRate = _discountRate;
      startAt = block.timestamp;
      expireAt = block.timestamp + DURATION;
      require(
          _startingPrice  >= _discountRate * DURATION,
          "starting price less than discount"
          );

      nft = IERC721(_nft);
      nftId = _nftId;
  }

  function getPrice() public view returns(uint){
      uint timeElapsed = block.timestamp - startAt;
      uint discount = discountRate * timeElapsed;
      return startingPrice - discount;
  }

  function buy() external payable {
      require(block.timestamp < expireAt,"auction expired");
      uint price = getPrice();
      require(msg.value >= price, "ETH < price");
      nft.transferFrom(seller, msg.sender, nftId);
      uint refund = msg.value - price;
      if(refund > 0){
          payable(msg.sender).transfer(refund);
      }
      selfdestruct(payable(seller));
  }
}