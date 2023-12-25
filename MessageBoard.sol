// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MessageBoard {
    mapping(address => string) public messages;

    event MessagePosted(address indexed user, string message);

    function postMessage(string calldata newMessage) public {
        require(bytes(newMessage).length <= 140, "Message too long");
        messages[msg.sender] = newMessage;
        emit MessagePosted(msg.sender, newMessage);
    }

    function getMessage(address user) public view returns (string memory) {
        return messages[user];
    }
}