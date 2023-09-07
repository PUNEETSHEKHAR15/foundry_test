// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import {Test, console2} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
    }

    // first test
    function testinc() public {
        counter.increment();
        assertEq(counter.count(), 1);
    }

    // test will fail due to underflow because count is mentioned as uint not int

    // function testdec() public {
    //     counter.decrement();
    //     assertEq(counter.count(), 0);
    // }

    // testFail is passes the condition means code is breaking somewhere
    function testFailDec() public {
        counter.decrement();
    }

    function testcheck() public {
        counter.increment();
        counter.increment();
        counter.decrement();
        assertEq(counter.count(), 1);
    }

    function testcheck1() public {
        counter.increment();
        counter.increment();
        counter.increment();
        counter.decrement();
        assertEq(counter.count(), 2);
    }

    // function testDecUnderFlow() public {
    //     vm.expectRevert(airthmeticError);
    //     counter.decrement();
    // }

    // to check gas report (--gas-report) it will display the function call according to test file.

    int256 x = -1;

    function testSomething() public view returns (int256) {
        console2.logInt(x);
        return x;
    }
}
