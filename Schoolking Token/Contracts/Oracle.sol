// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface AggregatorV3Interface {

    function latestRoundData()
        external
        view
        returns (
            uint80,
            int256,
            uint256,
            uint256,
            uint80
        );
}

contract Oracle {

    AggregatorV3Interface internal priceFeed;

    constructor(address feedAddress) {

        priceFeed =
            AggregatorV3Interface(feedAddress);
    }

    function getLatestPrice()
        public
        view
        returns (int256)
    {

        (
            ,
            int256 price,
            ,
            ,
            
        ) = priceFeed.latestRoundData();

        return price;
    }
}