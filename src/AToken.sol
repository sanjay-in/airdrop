// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.25;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title AToken
 * @notice This Token is used for Airdrop
 */
contract AToken is ERC20, Ownable {
    // State variables
    address public immutable i_owner;

    constructor() ERC20("AToken", "AT") Ownable(msg.sender) {
        i_owner = msg.sender;
    }

    /**
     * @notice This function is used to mint ATokens
     * @param _amount number to tokens to mint
     */
    function mint(address _account, uint256 _amount) external onlyOwner {
        _mint(_account, _amount);
    }
}
