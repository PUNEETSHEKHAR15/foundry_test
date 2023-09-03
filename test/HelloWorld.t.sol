//SPDX-License-Identifer:MIT
pragma solidity 0.8.17;

import {Test} from "forge-std/Test.sol";
import {HelloWorld} from "../src/HelloWorld.sol";

contract HelloWorldTest is Test {
    // insstance of test
    HelloWorld public helloWorld;

    // function is deloyed setUp
    function setUp() public {
        helloWorld = new HelloWorld();
    }

    // check greet value 1. call that
    function testgreet() public {
        assertEq(helloWorld.greet(), "Hello World?");
    }
}
