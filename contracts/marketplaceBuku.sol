// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract marketplaceBuku{
    struct Buku {
        uint id;
        string namaBuku;
        uint hargaBuku;
        address 
    }

    Buku[] public semuaBuku;
    uint public bookId;

    function tambahBuku(string memory _namaBuku, uint _hargaBuku) public {
        semuaBuku.push(Buku(bookId, _namaBuku, _hargaBuku));
        bookId++;
    }

    function membeliBuku(uint _id) public payable{
        
    }
}