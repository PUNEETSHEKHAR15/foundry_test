// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

contract Counter {
    uint256 public count;

    function getCount() public view returns (uint) {
        return count;
    }

    function increment() public {
        count += 1;
    }

    function decrement() public {
        count -= 1;
    }
}
