// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

// add inheritance
contract sToken is ERC20 ,Ownable, ERC20Burnable {
    address _owner;
    // insert constructor function here
    constructor(string memory _name ,  string memory _symbol) ERC20(_name , _symbol){
    _owner = msg.sender;
    }
    modifier onlyOwner1(){
        require(msg.sender == _owner, "You are not the owner");
        _;
    }
    // insert mint function here
    function mint(address to, uint amount) external onlyOwner1() {
        _mint(to, amount);
    }
    
    // insert burn function here
    function burn(address to , uint amount)external onlyOwner1() returns(bool){
        _burn(to,amount);
        return true;
    }
}
