// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract SchoolNFT is ERC721 {

    uint256 public nextTokenId;

    constructor()
        ERC721("SchoolNFT", "SNFT")
    {}

    function mintNFT(address to) public {

        _safeMint(to, nextTokenId);

        nextTokenId++;
    }
}