// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {MoodNft} from "../src/MoodNft.sol";

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

contract MintMoodNft is Script {
    // string public constant HAPPY_TOKENURI =
    //     "data:application/json;base64,eyJuYW1lIjogIk1vb2QgTkZUIiwgImRlc2NyaXB0aW9uIjogIkFuIE5GVCB0aGF0IHJlZmxlY3RzIHlvdXIgbW9vZCEiLCAiYXR0cmlidXRlcyI6IFt7InRyYWl0X3R5cGUiOiAiTW9vZCIsICJ2YWx1ZSI6IDEwMH1dLCAiaW1hZ2UiOiAiZGF0YTppbWFnZS9zdmcreG1sO2Jhc2U2NCxQSE4yWnlCMmFXVjNRbTk0UFNJd0lEQWdNakF3SURJd01DSWdkMmxrZEdnOUlqUXdNQ0lnSUdobGFXZG9kRDBpTkRBd0lpQjRiV3h1Y3owaWFIUjBjRG92TDNkM2R5NTNNeTV2Y21jdk1qQXdNQzl6ZG1jaVBqeGphWEpqYkdVZ1kzZzlJakV3TUNJZ1kzazlJakV3TUNJZ1ptbHNiRDBpZVdWc2JHOTNJaUJ5UFNJM09DSWdjM1J5YjJ0bFBTSmliR0ZqYXlJZ2MzUnliMnRsTFhkcFpIUm9QU0l6SWk4K1BHY2dZMnhoYzNNOUltVjVaWE1pUGp4amFYSmpiR1VnWTNnOUlqY3dJaUJqZVQwaU9ESWlJSEk5SWpFeUlpOCtQR05wY21Oc1pTQmplRDBpTVRJM0lpQmplVDBpT0RJaUlISTlJakV5SWk4K1BDOW5Qanh3WVhSb0lHUTlJbTB4TXpZdU9ERWdNVEUyTGpVell5NDJPU0F5Tmk0eE55MDJOQzR4TVNBME1pMDRNUzQxTWkwdU56TWlJSE4wZVd4bFBTSm1hV3hzT201dmJtVTdJSE4wY205clpUb2dZbXhoWTJzN0lITjBjbTlyWlMxM2FXUjBhRG9nTXpzaUx6NDhMM04yWno0PSJ9";

    function run() external {
        address mostRecentDeploy = DevOpsTools.get_most_recent_deployment(
            "MoodNft",
            block.chainid
        );
        mintNftOnContract(mostRecentDeploy);
    }

    function mintNftOnContract(address nftContract) public {
        vm.startBroadcast();
        MoodNft(nftContract).mintNft();
        vm.stopBroadcast();
    }
}

contract FlipMoodNft is Script {
    uint256 public constant TOKEN_ID_TO_FLIP = 0;

    function run() external {
        address mostRecentDeploy = DevOpsTools.get_most_recent_deployment(
            "MoodNft",
            block.chainid
        );
        flipNftOnContract(mostRecentDeploy);
    }

    function flipNftOnContract(address nftContract) public {
        vm.startBroadcast();
        MoodNft(nftContract).filpMood(TOKEN_ID_TO_FLIP);
        vm.stopBroadcast();
    }
}
