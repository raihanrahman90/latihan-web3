// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract marketplaceBarang{
    struct Item {
        uint id;
        string name;
        uint price;
        address owner;
    }

    Item[] public allItem;
    uint public itemId;
    
    event setor(address indexed account, uint nilai);
    event tarik(address indexed account, uint nilai);
    event payment(address indexed account, uint itemId);

    mapping(address => uint) public saldo;

    function addItem(string memory _name, uint _price) public {
        allItem.push(Item(itemId, _name, _price, msg.sender));
        itemId++;
    }

    function buyItem(uint _id) public payable {
        Item storage item = allItem[_id];
        require(item.price < saldo[msg.sender], "You don't have enough ETH to buy this item");
        address sellerAddress = item.owner;
        address buyerAddress = msg.sender;
        saldo[buyerAddress] -= item.price;
        saldo[sellerAddress] += item.price;
        item.owner = buyerAddress;
        emit payment(buyerAddress, _id);
    }

    function deposit() public payable {
        saldo[msg.sender] += msg.value;
        emit setor(msg.sender, msg.value);
    }
    
    function withdrawal(uint _nilai) public {
        require(saldo[msg.sender] >= _nilai, "Saldo kurang");
        payable(msg.sender).transfer(_nilai);
        saldo[msg.sender] -= _nilai;
        emit tarik(msg.sender, _nilai);
    }

    function getBalance() public view returns (uint) {
        return saldo[msg.sender];
    }

}