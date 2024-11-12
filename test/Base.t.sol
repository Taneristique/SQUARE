// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {ISquare} from "../src/interface/ISquare.sol";
import {Square} from "../src/contracts/Square.sol";

abstract contract Base is Test{
    ISquare squareContract;
    error willOverflow();
    
    function setUp() external virtual{
        squareContract = ISquare(address(new Square()));
    }

    function testSquareFailsIfInputToBig() public virtual{
        uint256 x = 0xffffffffffffffffffffffffffffffff + 1;
        vm.expectRevert(0x62263654);
        squareContract.square(x);
    }

    function testSomeValues() public virtual{
        uint256 x =  0xffffffffffffffffffffffffffffffff; //biggest possible value
        assertEq(squareContract.square(x), 0xfffffffffffffffffffffffffffffffe00000000000000000000000000000001);
        x = 0xC;
        assertEq(squareContract.square(x), 0x90);
    }
    function testFuzz_SquareWorksAccordingly() public {
        uint256 x;
        vm.assume(x <= 0xffffffffffffffffffffffffffffffff);
        require(squareContract.square(x) == (x * x));
    }

    function testFuzz_TryAllPossibilities(uint256 x) public {
        if(x> 0xffffffffffffffffffffffffffffffff){
            vm.expectRevert(0x62263654);    
            squareContract.square(x);
        }
        else if(x <= 1){
            assertEq(squareContract.square(x), x);
        }
        else{
            assertGt(squareContract.square(x), x);
        }
    }
}