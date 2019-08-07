pragma solidity ^0.5.0;

contract Election{
	 //Model the candidate
	 struct Candidate{
	 	uint id;  
	 	string name;
	 	uint voteCount;
	 }

	 //store accounts that have voted
	 mapping(address => bool) public voters;
	 //Store Candidates
	 //Fetch Candidates
	 mapping(uint => Candidate) public candidates;
	 //store candidate Count
	 uint public candidatesCount;

	 	constructor () public{
	 	//These method will get executed whenever our contract gets migrated or deployed
	 	addCandidate("Batteries");
	 	addCandidate("Arduino Boards"); 


	}

	function addCandidate(string memory  _name) private { //kept private as we dont want it to interact
		candidatesCount ++; //candidate ref
		candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
	}

	function vote(uint _candidateId) public {
		//require that address have not voted before
		require(!voters[msg.sender]);//require takes a condition if it is true then it will be executed else it will be not


		//require a  valid candidate
		require(_candidateId > 0 && _candidateId <= candidatesCount);



		//record that voter has voted
		voters[msg.sender] = true; //it will send the account details of person who will be calling this function 

		//update candidate vote count
		candidates[_candidateId].voteCount ++;
	}
} 