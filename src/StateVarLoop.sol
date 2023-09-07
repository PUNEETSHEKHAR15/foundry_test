//SPDX-License-Identifer:MIT
pragma solidity 0.8.17;

contract state {
    uint loop_count = 100;
    uint num_value = 0;

    // bad
    function bad() public {
        for (uint i = 0; i < loop_count; i++) {
            num_value++;
        }
    }

    function bad1() public {
        uint count = loop_count;
        for (uint i = 0; i < count; i++) {
            num_value++;
        }
    }

    function good() public {
        uint count = loop_count;
        uint temp_value = num_value;
        for (uint i = 0; i < count; i++) {
            num_value++;
        }
        num_value = temp_value;
    }

    function good1() public {
        uint temp_value = num_value;
        for (uint i = 0; i < loop_count; i++) {
            num_value++;
        }
        num_value = temp_value;
    }
}
