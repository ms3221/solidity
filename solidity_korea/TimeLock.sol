// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.3;

contract TimeLock{
    error NotOwnerError();
    error AlreadyQueuedError(bytes32 txId);
    error TimestampNotInRangeError(uint blockTimeStamp, uint timestamp);
    error TimestampExpireError(uint BlockTimestamp, uint expiresAt);
    
    //execute 
    error NotQueuedError(bytes32 txId);
    error  TimestampNotPassedError(uint Blocktimestamp, uint timestamp);
    error TxFailedError();
    
    event Queue(
        bytes32 indexed txId,
        address indexed _target,
        uint _value,
        string  _func,
        bytes  _data,
        uint _timestamp);


        event Execute(
        bytes32 indexed txId,
        address indexed _target,
        uint _value,
        string  _func,
        bytes  _data,
        uint _timestamp);

        event Cancel(bytes32 txId);

    uint public constant MIN_DELAY = 10;
    uint public constant MAX_DELAY = 1000;
    uint public constant GRACE_PERIOD = 1000;
    
    address public owner;

    mapping(bytes32 => bool) public queued;
    constructor(){
        owner = msg.sender;
    }
    receive() external payable{}

    modifier onlyOwner(){
        if(msg.sender != owner){
            revert NotOwnerError();
        }
        _;
    }
    function getTxId(
         address _target,
        uint _value,
        string calldata _func,
        bytes calldata _data,
        uint _timestamp
    )public pure returns(bytes32 txId){
        return keccak256(abi.encode(_target,_value,_func,_data,_timestamp));
    }
    function queue(
        address _target,
        uint _value,
        string calldata _func,
        bytes calldata _data,
        uint _timestamp
    )external onlyOwner{
        bytes32 txId = getTxId(_target,_value,_func,_data,_timestamp);
        if(queued[txId]){
            revert AlreadyQueuedError(txId);
        }
        if(_timestamp < block.timestamp + MIN_DELAY || 
           _timestamp > block.timestamp + MAX_DELAY
        ){
            revert TimestampNotInRangeError(block.timestamp, _timestamp);
        }

        queued[txId] = true;
        emit Queue(
            txId,_target,_value,_func,_data,_timestamp
        );

      
        // create tx id 
        // check tx id unique
        // check timestamp 
        // queue tx 

    }


    function execute(
        address _target,
        uint _value,
        string calldata _func,
        bytes calldata _data,
        uint _timestamp
    ) external payable onlyOwner returns(bytes memory ){
      bytes32 txId = getTxId(_target,_value,_func,_data,_timestamp);
      if(!queued[txId]){
          revert NotQueuedError(txId);
      }
      if(block.timestamp < _timestamp){
          revert TimestampNotPassedError(block.timestamp, _timestamp);
      }
      if(block.timestamp > _timestamp + GRACE_PERIOD){
          revert TimestampExpireError(block.timestamp, _timestamp+GRACE_PERIOD);
      }

        queued[txId] = false;
        bytes memory data;
        if(bytes(_func).length > 0){
            data = abi.encodePacked(
                bytes4(keccak256(bytes(_func))),_data
            );
            }else{
                data = _data;
            }
        

        //execute tx

      (bool ok, bytes memory res) =  _target.call{value: _value}(data);
      if(!ok){
          revert TxFailedError();
      }
      emit Execute(txId,_target,_value,_func,_data,_timestamp);
      return res;
      //check tx is queued
      //check block.timestamp > _timestamp
      //deletee tx from queue
      // execute the tx
    }

    function cancel(bytes32 txId) external onlyOwner {
        if(!queued[txId]){
            revert NotQueuedError(txId);
        }
        queued[txId] = false;
        emit Cancel(txId);
    }
}

contract TestTimeLock{
    address public timeLock;

    constructor(address _timeLock){
        timeLock = _timeLock;
    }

    function test() external view  returns(bool){
         require(msg.sender == timeLock);
         return true;
    //more code h
    }

    function getTimestamp() external view returns(uint){
        return block.timestamp + 100;
    }
   
}