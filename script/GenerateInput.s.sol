// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.25;

import {Script} from "forge-std/Script.sol";

contract GenerateInput is Script {
    string[] public types = new string[](2);
    string[] public whitelistedAddresses = new string[](4);
    uint256 public count;

    uint256 public constant CLAIM_AMOUNT = 25 ether;
    string public constant TARGET_FILE = "/target/input.json";

    function run() external {
        types[0] = "address";
        types[1] = "uint";
        count = whitelistedAddresses.length;
        whitelistedAddresses[0] = "";
        whitelistedAddresses[1] = "";
        whitelistedAddresses[2] = "";
        whitelistedAddresses[3] = "";

        string memory input = _createJSON();
        vm.writeFile(string.concat(vm.projectRoot(), TARGET_FILE), input);
    }

    function _createJSON() internal returns (string memory) {
        string memory json;
        string memory typesString;
        string memory claimAmountString = vm.toString(CLAIM_AMOUNT);
        string memory countString = vm.toString(count);

        // create type string
        typesString = "[";
        for (uint i = 0; i < types.length; i++) {
            typesString = string.concat(typesString, '"', types[i], '"');
        }
        typesString = string.concat(typesString, "]");

        // create json string
        json = string.concat(
            '"types":',
            typesString,
            ',"count":',
            countString,
            ',"values":{'
        );
        for (uint i = 0; i < whitelistedAddresses.length; i++) {
            json = string.concat(json, '"', vm.toString(i), '"', ": {");
            for (uint j = 0; j < types.length; j++) {
                string.concat(
                    json,
                    '"',
                    vm.toString(j),
                    '": ',
                    '"',
                    typeName,
                    '",'
                );
            }
            json = string.concat(json, "},");
        }
    }
}
