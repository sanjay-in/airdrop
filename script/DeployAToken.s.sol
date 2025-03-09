// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.25;

import {Script} from "forge-std/Script.sol";
import {AToken} from "../src/AToken.sol";

contract DeployAToken is Script {
    function run() external returns (AToken) {
        vm.startBroadcast();
        AToken aToken = new AToken();
        vm.stopBroadcast();
        return aToken;
    }
}
