// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.7.0 <0.9.0;

import {HuffDeployer} from "foundry-huff/HuffDeployer.sol";
import {Base, ISquare} from "./Base.t.sol";

contract SquareHuffTest is Base{
  function setUp() public override{
    // Deploy a new instance of src/contracts/Square.huff
    squareContract = ISquare(HuffDeployer.config().with_args(bytes((abi.encode(uint256(0x08))))).deploy("contracts/Square"));
  }
  
}