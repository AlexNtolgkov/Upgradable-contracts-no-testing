//SPDX-License-Identifier: MIT
pragma solidity 0.8.27;
import {UUPSUpgradeable} from "../lib/openzeppelin-contracts-upgradeable/contracts/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "../lib/openzeppelin-contracts-upgradeable/contracts/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "../lib/openzeppelin-contracts-upgradeable/contracts/access/OwnableUpgradeable.sol";
contract Zoo1 is Initializable, OwnableUpgradeable, UUPSUpgradeable {

uint256 internal numberofVisitors;

    constructor() {
        _disableInitializers();
    }

    function initialize () public initializer {
        __Ownable_init(msg.sender);
    }

    function GetnumberofVisitors() external view returns(uint256){
    return numberofVisitors;
    }

    function version() external pure returns(uint256){
    return 1;       
    }

function _authorizeUpgrade(address newImplementation) internal view override onlyOwner {
    require(newImplementation != address(0), "Invalid implementation address");
}

}