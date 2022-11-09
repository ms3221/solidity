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

contract PNSRegistry {
  ENS public ens;
  ENSResolver public resolver;
  address private owner;
  string[] private rootNodes;
  
  event PNSRegistered(string, address);
  constructor(
    ENS _ens,
    ENSResolver _resolver,
    string[] memory _rootNodes
  ) {
    ens = _ens;
    resolver = _resolver;
    owner = msg.sender;
    rootNodes = _rootNodes;
  }

  modifier onlyOwner() {
    require(msg.sender == owner, "Only owner can call this function.");
    _;
  }

  function register(
    address _target,
    string memory _label
  )
    external
  {
    string[] memory nodes = new string[](rootNodes.length + 1);
    for (uint i = 0; i < rootNodes.length; i++) {
      nodes[i] = rootNodes[i];
    }
    nodes[rootNodes.length] = _label;

    ens.setSubnodeRecord(
      _getNodeHash(rootNodes),
      keccak256(abi.encodePacked(_label)),
      address(this),
      address(resolver),
      0
    );

    resolver.setAddr(_getNodeHash(nodes), _target);
    ens.setOwner(_getNodeHash(nodes), _target );
    emit PNSRegistered(_label, _target);
  }

  function _getNodeHash(
    string[] memory _nodes
  )
    internal
    pure
    returns (
      bytes32 namehash
    )
  {
    namehash = 0x0000000000000000000000000000000000000000000000000000000000000000;

    for (uint i = 0; i < _nodes.length; i++) {
      namehash = keccak256(
        abi.encodePacked(namehash, keccak256(abi.encodePacked(_nodes[i])))
      );
    }
  }
}