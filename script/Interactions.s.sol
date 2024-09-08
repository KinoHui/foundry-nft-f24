// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract MintBasicNft is Script {
    string public constant TOKENURI =
        "ipfs://QmdD5ECABqWjseECSp2jiJ9V3eu7uYN2atr8qfZsahbsZb";

    function run() external {
        address mostRecentDeploy = DevOpsTools.get_most_recent_deployment(
            "BasicNft",
            block.chainid
        );
        mintNftOnContract(mostRecentDeploy);
    }

    function mintNftOnContract(address nftContract) public {
        vm.startBroadcast();
        BasicNft(nftContract).mintNFT(TOKENURI);
        vm.stopBroadcast();
    }
}
