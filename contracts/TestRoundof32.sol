// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/*
QAT ECU SEN NET
ENG IRA USA WAL
ARG SAU MEX POL
FRA DEN TUN AUS

SPA GER JAP COS
BEL CAN MOR CRO
BRA SER SWI CAM
POR GHA URU KOR
*/

// 1 bat = 0.01 ETHER

contract TestRound {

    address private owner;

    modifier isOwner() {
        require(msg.sender == owner, "Caller is not owner");
        _;
    }

    event OwnerSet(address indexed oldOwner, address indexed newOwner);

    function getOwner() external view returns (address) {
        return owner;
    }

    constructor() {
        console.log("Owner contract deployed by:", msg.sender);
        owner = msg.sender; // 'msg.sender' is sender of current call, contract deployer for a constructor
        emit OwnerSet(address(0), owner);
    }

    struct Bat {
        byte32[] winner;
        byte32[] loser;
        uint diff;
        uint multiple;
    }

    mapping(address => Bat) public Bidders;

    // call web3
    function Participate(byte32[] _winner, byte32[] _loser, uint _diff) public payable returns (bool) {

        require( _winner.length > 0 && _loser.length > 0 && _diff >= 0);

        Bidders[msg.sender].push(Bat({
            winner: _winner,
            loser: _loser,
            diff: _diff,
            multiple: msg.value
        }));

        return true;
    }

    // winner is...
    function reveal(byte32[] _winner, byte32[] _loser, uint _diff) public isOwner() {

    }

    // transfer winner prize
    function SendWinnerPrize() internal {

    }

}