//SPDX-License-Identifier:MIT
pragma solidity 0.8.17;

import {Test} from "forge-std/Test.sol";
import {Error} from "../src/Error.sol";

contract testError is Test {
    Error err;

    function setUp() public {
        err = new Error();
    }

    function testFail() public view {
        err.throwError();
    }

    function testRevertFail() public {
        vm.expectRevert(bytes("not authorised"));
        err.throwError();
    }

    // custom erros
    function testCustomError() public {
        vm.expectRevert(Error.notAuthorised.selector);
        err.throwCustomError();
    }

    // how to label the assertions
    function testLabel() public {
        assertEq(uint(1), uint(1), "test 1 ");
        assertEq(uint(1), uint(1), "test 2 ");
        assertEq(uint(1), uint(1), "test 3 ");
        // this will print there is error in test3
        assertEq(uint(1), uint(1), "test 4 ");
    }
}
