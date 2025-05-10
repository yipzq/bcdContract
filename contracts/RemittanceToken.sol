// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract RemittanceToken is ERC20, Ownable {
    event TokensMinted(address indexed user, uint256 tokenAmount);
    event TokensBurned(address indexed user, uint256 tokenAmount);    
    event TokensSent(address indexed from, address indexed to, uint256 amount);   // for tracking token transfers
    
    // Add a public minting flag that only the owner can toggle
    bool public publicMintingEnabled;
    
    constructor() ERC20("RemittanceToken", "RMT") Ownable(msg.sender) {
        publicMintingEnabled = false; 
    }
    
    // Function to toggle public minting (only owner)
    function togglePublicMinting(bool enabled) external onlyOwner {
        publicMintingEnabled = enabled;
    }

    // Modified to allow public minting when enabled
    function mintForUser(address user, uint256 balance) external {
        require(balance > 0, "Amount must be greater than zero");
        
        // Allow either the owner OR anyone when public minting is enabled
        require(msg.sender == owner() || publicMintingEnabled, 
                "Not authorized to mint tokens");

        uint256 tokenAmount = balance * 10**decimals();
        _mint(user, tokenAmount);

        emit TokensMinted(user, tokenAmount);
    }

    // Keep burn function only for owner
    function burnTokensForUSD(address user, uint256 tokenAmount) external {
        require(tokenAmount > 0, "Amount must be greater than zero");
        require(balanceOf(user) >= tokenAmount, "Insufficient RMT balance");
        
        // Allow either the owner OR the token holder themselves
        require(msg.sender == owner() || msg.sender == user, 
                "Not authorized to burn these tokens");

        _burn(user, tokenAmount);

        emit TokensBurned(user, tokenAmount);
    }

    // send tokens to another user
    function sendTokens(address recipient, uint256 amount) external returns (bool) {
        require(recipient != address(0), "Cannot send to zero address");
        require(amount > 0, "Amount must be greater than zero");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        
        // Use the standard ERC20 transfer function
        bool success = transfer(recipient, amount);
        
        // Emit custom event for better tracking
        if (success) {
            emit TokensSent(msg.sender, recipient, amount);
        }
        
        return success;
    }

    // Add this function to your RemittanceToken contract
    function transferTokensFromBackend(address from, address to, uint256 amount) external onlyOwner {
        require(from != address(0), "Invalid sender address");
        require(to != address(0), "Invalid recipient address");
        require(balanceOf(from) >= amount, "Insufficient balance");
        
        _transfer(from, to, amount);
        
        emit TokensSent(from, to, amount);
    }

}