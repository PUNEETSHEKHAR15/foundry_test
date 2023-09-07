//SPDX-License-Identifer:MIT
pragma solidity 0.8.17;

import {Test} from "forge-std/Test.sol";
import {Auction} from "../src/Time.sol";

contract testAuction is Test {
    Auction auction;
    uint256 public startAt;

    function setUp() public {
        auction = new Auction();
    }

    // to check the bid function it should be more then 1 day
    // to accomplish that vm.warp is used to set the future timestamp
    function testbidFail() public {
        vm.expectRevert(bytes("cannot bid"));
        // vm.expectRevert expect the revert , if condition will be true it shows an error.

        // vm.warp(startAt + 1.5 days);
        auction.bid();
    }

    function testBid() public {
        vm.warp(startAt + 1.5 days);
        auction.bid();
    }

    // skip is used to incremrnt block.timestamp
    // rewind  used to decrement block.timestamp

    function testSkip() external {
        uint t = block.timestamp;
        skip(100); // 100 seconds
        assertEq(block.timestamp, t + 100);

        rewind(10);
        assertEq(block.timestamp, t + 90);
    }

    // to check the block.number
    function testBlock() external {
        // uint t = block.number;
        vm.roll(999);
        assertEq(block.number, 999);
    }
}
