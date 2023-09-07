//SPDX-License-Identifer:MIT
pragma solidity 0.8.17;

import {Test} from "forge-std/Test.sol";
import {state} from "../src/StateVarLoop.sol";

contract teststate is Test {
    state instance;

    function setUp() public {
        instance = new state();
    }

    function testbad() public {
        instance.bad();
    }

    function testbad1() public {
        instance.bad1();
    }

    function testgood() public {
        instance.good();
    }

    function testgood1() public {
        instance.good1();
    }
}
