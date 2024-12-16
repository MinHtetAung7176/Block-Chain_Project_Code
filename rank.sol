// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CarbonCreditRanker {
    struct CarbonCredit {
        string name;
        uint256 score;
        address owner;
    }

    CarbonCredit[] public carbonCredits;

    event CarbonCreditAdded(string name, uint256 score, address owner);

    function addCarbonCredit(string memory _name, uint256 _score) public {
        require(_score <= 100, "Score must be between 0 and 100");
        CarbonCredit memory newCredit = CarbonCredit({
            name: _name,
            score: _score,
            owner: msg.sender
        });
        carbonCredits.push(newCredit);
        emit CarbonCreditAdded(_name, _score, msg.sender);
    }

    function getTopRankedCredit()
        public
        view
        returns (string memory name, uint256 score, address owner)
    {
        require(carbonCredits.length > 0, "No carbon credits available");

        CarbonCredit memory topCredit = carbonCredits[0];
        for (uint256 i = 1; i < carbonCredits.length; i++) {
            if (carbonCredits[i].score > topCredit.score) {
                topCredit = carbonCredits[i];
            }
        }
        return (topCredit.name, topCredit.score, topCredit.owner);
    }

    function getCarbonCreditCount() public view returns (uint256) {
        return carbonCredits.length;
    }
}
