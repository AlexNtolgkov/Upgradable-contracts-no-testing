//SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

import {Script} from "forge-std/Script.sol";
import {Zoo1} from "../src/Zoo1.sol";
import {ERC1967Proxy} from  "../lib/openzeppelin-contracts/contracts/proxy/ERC1967/ERC1967Proxy.sol";

contract DeployZoo is Script{

function run() external returns(address) {
address proxy = deployZoo();
return proxy;
} 


function deployZoo() public returns(address){
Zoo1 zoo = new Zoo1(); 
ERC1967Proxy proxy = new ERC1967Proxy(address(zoo), "");
return address(proxy);

}
}