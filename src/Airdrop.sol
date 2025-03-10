// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.25;

import {AToken} from "./AToken.sol";

contract Airdrop {
    AToken private immutable i_aToken;
    mapping(address user => bool claimed) private s_hasClaimed;

    constructor(address _aToken) {
        i_aToken = AToken(_aToken);
    }
}
