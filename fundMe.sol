// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {priceConverter} from "./conversionRate.sol";

contract fundme{

    using priceConverter for uint256;

    uint public MINIMUM_USD = 5e18;

    address [] public funders;
    mapping ( address funder => uint256 amtFunded) public addressToAmountFunded;

    address public owner;

    constructor (){
        owner = msg.sender;
    }

    
    function fund() public payable {

        require (msg.value.getCoversionRate() >= MINIMUM_USD, "Not enough Eth");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;

    }

    // address : 0x694AA1769357215DE4FAC081bf1f309aDC325306
    // abi 
    function withdraw() public onlyOwner {
        for (uint funderIndex = 0; funderIndex < funders.length; funderIndex ++) 
        {
          address funder = funders [funderIndex];
          addressToAmountFunded [funder];
        }
        funders = new address[](0);
         (bool success, ) = payable(msg.sender).call{value: address(this).balance}("");
         require(success, "Call failed");

    }

    modifier onlyOwner (){
        require (msg.sender == owner, "must be a owner"); 
        _;
    }

    
}