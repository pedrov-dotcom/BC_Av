// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract DAO {

    struct Proposal {

        string description;

        uint256 votes;
    }

    Proposal[] public proposals;

    mapping(address => bool) public voted;

    function createProposal(
        string memory description
    ) public {

        proposals.push(
            Proposal(description, 0)
        );
    }

    function vote(uint256 proposalId)
        public
    {

        require(
            !voted[msg.sender],
            "Ja votou"
        );

        proposals[proposalId].votes++;

        voted[msg.sender] = true;
    }
}