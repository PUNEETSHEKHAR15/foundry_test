//SPDX-License-Identifer:MIT
pragma solidity 0.8.17;

contract Owner {
    address public owner;

    // set the owner when contract will deploy
    constructor() {
        owner = payable(msg.sender);
    }

    // receive the payment
    receive() external payable {}

    // withdraw function
    function withdraw(uint256 amount) external {
        require(msg.sender == owner, "caller is not an owner");
        payable(msg.sender).transfer(amount);
    }

    //change ownership of contract
    function changeOwnerShip(address _owner) external {
        require(msg.sender == owner, "caller is not an owner");
        owner = payable(_owner);
    }
}
