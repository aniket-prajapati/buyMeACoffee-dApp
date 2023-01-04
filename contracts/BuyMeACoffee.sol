// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Coffee {
    struct Memo {
        string name;
        string message;
        uint timestamp;
        address from;
    }

    Memo[] public memos;
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function buyCoffee(
        string memory name,
        string memory message
    ) external payable {
        require(msg.value > 0, "pay more than 0");
        owner.transfer(msg.value);
        memos.push(Memo(name, message, block.timestamp, msg.sender));
    }

    function getMemos() public view returns (Memo[] memory) {
        return memos;
    }
}
