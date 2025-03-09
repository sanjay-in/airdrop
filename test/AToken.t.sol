// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.25;

import {AToken} from "../src/AToken.sol";
import {DeployAToken} from "../script/DeployAToken.s.sol";
import {Test, console} from "forge-std/Test.sol";
import {StdCheats} from "forge-std/StdCheats.sol";

contract ATokenTest is StdCheats, Test {
    AToken public aToken;

    function setUp() external {
        DeployAToken deployer = new DeployAToken();
        aToken = deployer.run();
    }

    // Constructor test
    function testOwner() public view {
        address aTokenOwner = aToken.i_owner();
        address deployerAddress = msg.sender;
        vm.assertEq(aTokenOwner, deployerAddress);
    }

    function testNameAndSymbol() public view {
        string memory setTokenName = "AToken";
        string memory setTokenSymbol = "AT";
        string memory aTokenName = aToken.name();
        string memory aTokenSymbol = aToken.symbol();
        vm.assertEq(setTokenName, aTokenName);
        vm.assertEq(setTokenSymbol, aTokenSymbol);
    }

    // Function test
    function testMintFunction() public {
        address deployerAddress = msg.sender;
        uint256 mintAmount = 100;

        vm.prank(deployerAddress);
        aToken.mint(deployerAddress, mintAmount);

        uint256 mintedAmount = aToken.balanceOf(deployerAddress);
        vm.assertEq(mintAmount, mintedAmount);
    }

    function testOnlyOwner() public {
        address newAddress = makeAddr("newAddress");
        uint256 mintAmount = 100;

        vm.prank(newAddress);
        vm.expectRevert();
        aToken.mint(newAddress, mintAmount);
    }
}
