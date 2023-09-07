//SPDX-License-Identifer:MIT
pragma solidity 0.8.17;
import {Test, console2} from "forge-std/Test.sol";
import {Owner} from "../src/Owner.sol";

contract OwnerTest is Test {
    Owner owner;

    // this will deploy the contract
    function setUp() public {
        owner = new Owner();
    }

    // things to test
    /*
    how is owner 
    ownership after tranfer 

    // */
    // // to check current owner
    // // here assetEq means ownwer of Owner.sol and Onwer entity of this contract is same
    // function testCurrentOwner() public {
    //     assertEq(owner.owner(), address(this));
    // }

    // // chnage the owner
    // function testNewOwner() public {
    //     owner.changeOwnerShip(address(1));
    //     assertEq(owner.owner(), address(1));
    // }

    // // error while executing this
    // // function testNewOwner1() public {
    // //     owner.changeOwnerShip(address(1));
    // //     assertEq(owner.owner(), address(1));
    // //     owner.changeOwnerShip(address(2));
    // //     assertEq(owner.owner(), address(2));
    // // }

    // // vm prank means -> the address which is being set inside
    // // that will be owner for next line executing after that
    // // example from above owner contrat to change the onwership
    // // owner should be this contract address
    // // but by changing vm.prank(address(0));
    // //now if you try to change ownership it won't change because prank changes the owner
    // function testFailSetOWner() public {
    //     // console2.log(address(this));
    //     // console2.log(address(1));
    //     vm.prank(address(1)); // here it show caller is not owner
    //     owner.changeOwnerShip(address(1));
    // }

    // function testFailSetOwners() public {
    //     // here we can change the ownership because here
    //     //msg.sender == address(this)
    //     owner.changeOwnerShip(address(1));
    //     console2.log(address(1));
    //     // here by below line method we are delaring the msg.sender as address(1);        vm.startPrank(address(1));
    //     owner.changeOwnerShip(address(1));
    //     owner.changeOwnerShip(address(1));
    //     owner.changeOwnerShip(address(1));
    //     vm.stopPrank();
    //     // now prank is been stoped
    //     // owner is changed as address(1)
    //     // but the function will be called by msg.sender= address(this)
    //     owner.changeOwnerShip(address(1));
    // }

    function testEth() external view {
        console2.log("Eth Balance", address(this).balance / 1e18);
    }
}
