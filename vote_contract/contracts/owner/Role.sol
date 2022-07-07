/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Role {
    mapping(address => bool) public isOwner;
    mapping(address => bool) public isLeadUser;
    address[] public owners;
    address[] public leadUsers;

    constructor(address[] memory _owners) {
        require(_owners.length > 0, "required");
        for (uint256 i; i < _owners.length; i++) {
            address owner = _owners[i];
            require(owner != address(0), "invalid owner");
            require(!isOwner[owner], "owner is not unique");
            isOwner[owner] = true;
            owners.push(owner);
        }
    }

    modifier unionFactoryRole(address roler) {
        require(isOwner[roler], "user is not owner");
        _;
    }

    // modifier leadUserRole(address roler) {
    //     require(isLeadUser[roler], "user is not leadUser");
    //     _;
    // }

    // function setLeadUser(address[] memory _leadUsers)
    //     external
    //     unionFactoryRole(msg.sender)
    // {
    //     require(_leadUsers.length > 0, "leadUsers required");
    //     for (uint256 i; i < _leadUsers.length; i++) {
    //         address leadUser = _leadUsers[i];
    //         require(leadUser != address(0), "invalid leadUser");
    //         require(!isLeadUser[leadUser], "leadUser is not unique");
    //         isLeadUser[leadUser] = true;
    //         leadUsers.push();
    //     }
    // }
}
