//SPDX-License-Identifier:MIT
pragma solidity 0.8.17;

contract Events {
    event Transfer(address indexed from, address indexed to, uint amount);

    function transfer(address from, address to, uint amount) external {
        emit Transfer(from, to, amount);
    }

    function TransferMany(
        address from,
        address[] calldata to,
        uint[] calldata amount
    ) external {
        for (uint i = 0; i < to.length; i++) {
            emit Transfer(from, to[i], amount[i]);
        }
    }
}
