pragma solidity 0.6.1;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Mintable.sol";

contract MyToken is ERC20, ERC20Mintable {
    constructor() ERC20Mintable() public {
        // super.mint(msg.sender);
    }

    function mint(address account, uint256 amount) public override returns(bool) {
        return super.mint(account, amount);
    }
}