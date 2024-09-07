//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";

contract BasicNFTTest is Test {
    DeployBasicNft public deployer;
    BasicNft public basicNft;
    address public user = makeAddr("user");
    string public constant TOKENURI =
        "ipfs://QmdD5ECABqWjseECSp2jiJ9V3eu7uYN2atr8qfZsahbsZb";

    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "zyc&jyh";
        string memory actualName = basicNft.name();
        assert(
            keccak256(abi.encodePacked(expectedName)) ==
                keccak256(abi.encodePacked(actualName))
        );
    }

    function testCanMintAndHaveABalance() public {
        vm.prank(user);

        basicNft.mintNFT(TOKENURI);

        assert(basicNft.balanceOf(user) == 1);
        assert(
            keccak256(abi.encodePacked(TOKENURI)) ==
                keccak256(abi.encodePacked(basicNft.tokenURI(0)))
        );
    }
}
