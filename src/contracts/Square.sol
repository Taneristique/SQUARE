// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.26;

contract Square {
    error willOverflow();
    function square(uint256 number) public pure returns(uint256){
        if(number > 0xffffffffffffffffffffffffffffffff){
            revert willOverflow();
        }
        return number * number;
    }
}
