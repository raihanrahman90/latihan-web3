// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract marketplaceBuku{
    struct Buku {
        uint id;
        string namaBuku;
        uint hargaBuku;
        address pemilikBuku;
    }

    Buku[] public semuaBuku;
    uint public bookId;

    function tambahBuku(string memory _namaBuku, uint _hargaBuku) public {
        semuaBuku.push(Buku(bookId, _namaBuku, _hargaBuku, msg.sender));
        bookId++;
    }

    function membeliBuku(uint _id) public payable{
        Buku storage buku = semuaBuku[_id];
        require(buku.hargaBuku < msg.value, "Silahkan bayar sesuai");
        buku.pemilikBuku = msg.sender;
    }
}