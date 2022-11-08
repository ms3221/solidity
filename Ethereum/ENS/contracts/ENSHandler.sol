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
    event NewEns(address to, bytes32 _label);

    ENS public ens = ENS(address(0x00000000000C2E074eC69A0dFb2997BA6C7d2e1e));
    ENSResolver public resolver = ENSResolver(address(0xE264d5bb84bA3b8061ADC38D3D76e6674aB91852));

    function setSubNode(bytes32 _rootNode, address _target, bytes32 _label, bytes32 _subNodeHash) external {
        ens.setSubnodeRecord(_rootNode, _label, address(this), address(resolver), 0);
        resolver.setAddr(_subNodeHash, _target);
        ens.setOwner(_subNodeHash, _target);
        emit NewEns(_target, _label);
    }

    function bytes32ToStr(bytes32  _bytes32) public pure returns (string memory) {

    // string memory str = string(_bytes32);
    // TypeError: Explicit type conversion not allowed from "bytes32" to "string storage pointer"
    // thus we should fist convert bytes32 to bytes (to dynamically-sized byte array)

    bytes memory bytesArray = new bytes(32);
    for (uint256 i; i < 32; i++) {
        bytesArray[i] = _bytes32[i];
        }
    return string(bytesArray);
    }
}
