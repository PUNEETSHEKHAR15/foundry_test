//SPDX-License-Identifier:MIT
pragma solidity 0.8.18;
import {Test} from "forge-std/Test.sol";
import {Event} from "../src/Event.sol";

contract testEvent is Test {
    Event e;
    event Transfer(address indexed from, address indexed to, uint amount);

    function setUp() public {
        e = new Event();
    }

    function testEmitTransferEvent() external {
        // 1. tell Foundry which data to check
        // place true for indeed values user need to check
        //check index 1 and index 2 and then data
        vm.expectEmit(true, true, false, true);
        // 2. emit the expected event
        emit Transfer(address(this), address(124), 124);
        // 3. call the function that should emit the event
        e.transfer(address(this), address(124), 124);

        // to only check for index1
        vm.expectEmit(true, false, false, false);
        // it just logs and check the true value not other that it don't have anything from other values
        emit Transfer(address(this), address(1234), 124);
        e.transfer(address(this), address(124), 124);
    }

    function testEmitTransferManyEvent() public {
        // enter the array data of to and amounts
        address[] memory to = new address[](2);
        to[0] = address(123);
        to[1] = address(456);

        uint[] memory amounts = new uint[](2);
        amounts[0] = 777;
        amounts[1] = 888;
        // it can be to length or amounts length also
        for (uint i = 0; i < amounts.length; i++) {
            vm.expectEmit(true, true, false, true);
            emit Transfer(address(this), to[i], amounts[i]);
        }

        e.transferMany(address(this), to, amounts);
    }
}
