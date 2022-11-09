// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


interface ENS {
    function setOwner(bytes32 node, address owner) external;
    function setSubnodeRecord(bytes32 node, bytes32 label, address owner, address resolver, uint64 ttl) external;
    function setSubnodeOwner(bytes32 node, bytes32 label, address owner) external returns(bytes32);
}

interface ENSResolver {
    function setAddr(bytes32 node, address a) external;
}

contract ENSHandler {

    ENS public ens;
    ENSResolver public resolver;
    address public owner;
    //pado.eth
    bytes32 rootNode;

    event NewPNS(string _label, address to);
    
    constructor(address _ensAddress, address _ensResolverAddress, string memory _mainENS) {
        owner = msg.sender;
        ens = ENS(address(_ensAddress));
        resolver = ENSResolver(address(_ensResolverAddress));
        rootNode = _handleMainNode(_mainENS);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    function setPNS(address _target, string calldata _label) onlyOwner external {
        ens.setSubnodeRecord(rootNode,  keccak256(abi.encodePacked(_label)), address(this), address(resolver), 0);
        resolver.setAddr(handleSubNode(_label), _target);
        ens.setOwner(handleSubNode(_label), _target);
        emit NewPNS(_label, _target);
    }


    function _handleMainNode(string memory _name) internal pure returns (bytes32 namehash) {
     namehash = 0x0000000000000000000000000000000000000000000000000000000000000000;
     namehash = keccak256(
     abi.encodePacked(namehash, keccak256(abi.encodePacked('eth')))
     );
     namehash = keccak256(
     abi.encodePacked(namehash, keccak256(abi.encodePacked(_name)))
     );
    }


    function handleSubNode(string memory _name) public view returns (bytes32 namehash) {
     namehash = rootNode;
     namehash = keccak256(
     abi.encodePacked(namehash, keccak256(abi.encodePacked(_name)))
     );
    }

     function nameHash(string[] memory _name) public pure returns (bytes32 namehash) {
     namehash = 0x0000000000000000000000000000000000000000000000000000000000000000;
     for(uint i=0; i<_name.length; i++){
      namehash = keccak256(
     abi.encodePacked(namehash, keccak256(abi.encodePacked(_name[i])))
     );
     }
    }
}



// bytes32 public bt = "hello! test";
// function bytes32ToString(bytes32 _bytes32) public pure returns (string memory) {
//         uint8 i = 0;
//         while(i < 32 && _bytes32[i] != 0) {
//             i++;
//         }
//         bytes memory bytesArray = new bytes(i);
//         for (i = 0; i < 32 && _bytes32[i] != 0; i++) {
//             bytesArray[i] = _bytes32[i];
//         }
//         return string(bytesArray);
//     }