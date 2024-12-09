// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./Interfaces.sol";

contract Addition is IAddition {
    uint256 number = 1;

    function addition(uint256 value) public {
        number += value;
    }
}

contract Subtraction is ISubtraction {
    uint256 number = 100;

    function subtraction(uint256 value) public {
        number -= value;
    }
}

contract Division is IDivision {
    function divisionBy2(uint256 number) public pure returns (uint256) {
        return number / 2;
    }

    function divisionBy128(uint256 number) public pure returns (uint256) {
        return number / 128;
    }
}

contract AdditionOptimized is IAddition {
    uint256 number = 1;

    function addition(uint256 value) public {
        assembly {
            let num := sload(0)
            num := add(num, value)
            sstore(0, num)
        }
    }
}

contract SubtractionOptimized is ISubtraction {
    uint256 number = 100;

    function subtraction(uint256 value) public {
        assembly {
            let num := sload(0)
            num := sub(num, value)
            sstore(0, num)
        }
    }
}

contract DivisionOptimized is IDivision {
    function divisionBy2(uint256 number) public pure returns (uint256) {
        return number >> 1;
    }

    function divisionBy128(uint256 number) public pure returns (uint256) {
        return number >> 7;
    }
}
