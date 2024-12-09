// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./Interfaces.sol";

contract Errors is IErrors {
    address owner;

    modifier onlyOwner() {
        require(owner == msg.sender, "Error: You are not a owner!");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function call() public view onlyOwner {}
}

contract ErrorsOptimized is IErrors {
    address immutable owner;

    modifier onlyOwner() {
        _checkOwner();
        _;
    }
    
    function _checkOwner() internal view virtual {
require (owner == msg.sender, "Error: You are not a owner!");
}

    constructor() {
        owner = msg.sender;
    }

    function call() public view onlyOwner {}
}
