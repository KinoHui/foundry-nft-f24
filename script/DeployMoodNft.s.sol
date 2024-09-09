// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {MoodNft} from "../src/MoodNft.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNft is Script {
    MoodNft moodNft;

    function run() external returns (MoodNft) {
        string memory happySvg = vm.readFile("./img/happy.svg");
        string memory sadSvg = vm.readFile("./img/sad.svg");
        vm.startBroadcast();
        moodNft = new MoodNft(getSvgToImgUri(happySvg), getSvgToImgUri(sadSvg));
        vm.stopBroadcast();
        return moodNft;
    }

    function getSvgToImgUri(
        string memory svg
    ) public pure returns (string memory) {
        string memory prifix = "data:image/svg+xml;base64,";
        return
            string(
                abi.encodePacked(
                    prifix,
                    Base64.encode(bytes(string(abi.encodePacked(svg))))
                )
            );
    }

    function getImgUriToTokenUri(
        string memory imageURI
    ) public returns (string memory) {
        string memory prifix = "data:application/json;base64,";
        return
            string(
                abi.encodePacked(
                    prifix,
                    Base64.encode(
                        bytes(
                            abi.encodePacked(
                                '{"name": "',
                                moodNft.name(),
                                '", "description": "An NFT that reflects your mood!", "attributes": [{"trait_type": "Mood", "value": 100}], "image": "',
                                imageURI,
                                '"}'
                            )
                        )
                    )
                )
            );
    }
}
