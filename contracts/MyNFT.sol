// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyNFT is ERC721URIStorage, Ownable {
    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {
        // 컨트랙트가 배포될 때 NFT를 발행해서 컨트랙트 소유권 자에게 부여한다. (수량은 임의로 정할 수 있죠)
        // for (uint256 i =0; i< 1000; i++) {
        //     _mint(msg.sender, i);
        // }
    }

    function mint(address to, uint256 tokenId, string memory tokenURI) public onlyOwner {
        _mint(to, tokenId);
        _setTokenURI(tokenId, tokenURI);
    }

    // 토큰 소유주 확인 
    function isTokenOwner(address owner, uint256 tokenId) public view returns (bool) {
        return ownerOf(tokenId) == owner;
    }
}