//SPDX-License-Identifier:MIT
pragma solidity 0.8.17;

contract Wallet {
    address public owner;
    event Deposit(address from, uint amount);

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint amount) external {
        require(owner == msg.sender, "caller is not owner");
        payable(msg.sender).transfer(amount);
    }

    function setOwner(address Owner) external {
        require(owner == msg.sender, "caller is not owner");
        owner = payable(Owner);
    }
}
