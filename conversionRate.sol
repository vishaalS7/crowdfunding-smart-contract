// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol"; //this is interface directly importing from npm and github


library priceConverter{

    function getPrice () public view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xfEefF7c3fB57d18C5C6Cdd71e45D2D0b4F9377bF); //zksync testnet eth - usd 
        (,int price,,,) = priceFeed.latestRoundData();
        return uint256 (price * 1e10); //price of eth in usd 2000_00000000//we need to make it 18,0s to make it round data
    }

    function getCoversionRate (uint ethAmount ) public view returns (uint256){
        uint ethPrice = getPrice();
         //2000_000000000000000000 x 1_000000000000000000 = 2000_000000000000000000000000000000000000 / 1000000000000000000 = 2000
        uint EthAmountinUsd = ( ethPrice * ethAmount) / 1e18;
        return EthAmountinUsd; //2000
    }
}