// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.26;

contract Square {
    error willOverflow();
    function square(uint256 number) public pure returns(uint256){
        if(number > 0xffffffffffffffffffffffffffffffff){ 
            /*The product would overflow if value > 340282366920938463463374607431768211455*/
            revert willOverflow();
        }
        return number * number;
    }
}
