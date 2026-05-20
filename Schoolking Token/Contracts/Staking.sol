// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

contract Staking is ReentrancyGuard {

    IERC20 public token;

    mapping(address => uint256) public stakes;

    constructor(address tokenAddress) {

        token = IERC20(tokenAddress);
    }

    function stake(uint256 amount)
        public
        nonReentrant
    {

        token.transferFrom(
            msg.sender,
            address(this),
            amount
        );

        stakes[msg.sender] += amount;
    }

    function withdraw(uint256 amount)
        public
        nonReentrant
    {

        require(
            stakes[msg.sender] >= amount,
            "Saldo insuficiente"
        );

        stakes[msg.sender] -= amount;

        token.transfer(msg.sender, amount);
    }
}