//SPDX-License-Identifier:MIT
pragma solidity 0.8.17;

contract Error {
    error notAuthorised();

    function throwError() external pure {
        require(false, "not authorised");
    }

    function throwCustomError() external pure {
        revert notAuthorised();
    }
}
