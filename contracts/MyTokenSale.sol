pragma solidity 0.6.1;

import "./Crowdsale.sol";
import "./MintedCrowdsale.sol";
import "./KycContract.sol";
import "./MyToken.sol";

contract MyTokenSale is MintedCrowdsale {

    KycContract kyc;

    constructor(
        uint256 rate,    // rate in TKNbits
        address payable wallet,
        ERC20Mintable token,
        KycContract _kyc
    )
        Crowdsale(rate, wallet, token)
        public
    {
        kyc = _kyc;
        //token.addMinter(msg.sender);
        //token.renouceMinter();

    }

    function _preValidatePurchase(address beneficiary, uint256 weiAmount) internal view override {
        super._preValidatePurchase(beneficiary, weiAmount);
        require(kyc.kycCompleted(msg.sender), "KYC Not completed, purchase not allowed");
    }
}