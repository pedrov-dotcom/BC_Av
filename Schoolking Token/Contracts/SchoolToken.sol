// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SchoolToken is ERC20 {

    constructor()
        ERC20("SchoolToken", "SKT")
    {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }
}