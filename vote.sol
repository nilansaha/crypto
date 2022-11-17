// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Payable {
    // Payable address can receive Ether
    address public owner;
    uint public count;

    struct Nominee {
        string name;
        uint count;
    }

    Nominee[] public nominees;
    mapping(address => uint) public voters;

    // Payable constructor can receive Ether
    constructor() {
        owner = msg.sender;
    }

    function addNominee(string memory nominee) public {
        require(msg.sender == owner, "Only owner can declare participants");
        nominees.push(Nominee({name:nominee, count:0}));
    }

    function vote(uint nomineeIdx) public {
        nominees[nomineeIdx].count += 1;
    }
}
