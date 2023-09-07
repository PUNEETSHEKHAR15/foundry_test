//SPDX-License-Identifier:MIT
pragma solidity 0.8.17;

import {Test, console2} from "forge-std/Test.sol";
import {Wallet} from "../src/Wallet.sol";

contract testEthBalance is Test {
    Wallet wallet;

    function setUp() external {
        wallet = new Wallet();
    }

    function sent(uint amount) private {
        (bool success, ) = address(wallet).call{value: amount}("");
        require(success, "failed");
    }

    function testEth() external view {
        console2.log("Eth Balance", address(this).balance / 1e18);
    }

    function testSendEth() public {
        deal(address(1), 100);
        assertEq(address(1).balance, 100);
        console2.log(address(1).balance);
    }
}
