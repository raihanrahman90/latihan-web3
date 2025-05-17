// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract miniBank{

    event setor(address indexed account, uint nilai);
    event tarik(address indexed account, uint nilai);

    mapping(address => uint) public saldo;

    function setorTunai() public payable {
        saldo[msg.sender] += msg.value;
        emit setor(msg.sender, msg.value)
    }
    
    function tarikTunai(uint _nilai) public {
        require(saldo[msg.sender] >= _nilai, "Saldo kurang")
        payable(msg.sender).transfer(_nilai);
        emit tarik(msg.sender, _nilai)
    }
}