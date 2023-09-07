//SPDX-License-Identifier:MIT
pragma solidity 0.8.17;
import {Test} from "forge-std/Test.sol";
import {Events} from "../src/Event.sol";

contract testEvent {
    Events e;
    event Transfer(address indexed from, address indexed to, uint amount);

    function setUp() public {
        e = new Events();
    }

    function testEmitTransferEvent() external {
        // 1. tell Foundry which data to check
        // place true for indeed values user need to check
        vm.expectEmit(address(transfer));
        // 2. emit the expected event
        emit Transfer(address(this), address(124), 124);
        // 3. call the function that should emit the event
        e.transfer(address(this), address(124), 124);
    }

    function testEmitTransferManyEvent() public {}
}
