// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract RemittanceToken is ERC20, Ownable {
    event TokensMinted(address indexed user, uint256 amount);
    event TokensBurned(address indexed user, uint256 amount);

    constructor() ERC20("RemittanceToken", "RMT") Ownable(msg.sender) {}

    function mintForUser(address user, uint256 usdAmount) external onlyOwner {
        require(usdAmount > 0, "Amount must be greater than zero");

        uint256 tokenAmount = usdAmount * 10**decimals();
        _mint(user, tokenAmount);

        emit TokensMinted(user, tokenAmount);
    }

    function burnTokensForUSD(address user, uint256 tokenAmount) external onlyOwner {
        require(tokenAmount > 0, "Amount must be greater than zero");
        require(balanceOf(user) >= tokenAmount, "Insufficient RMT balance");

        _burn(user, tokenAmount);

        emit TokensBurned(user, tokenAmount);
    }
}