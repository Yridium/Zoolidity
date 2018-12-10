//Zoolidity

pragma solidity ^0.4.25;

contract Zoo {

    event NewAnimal(uint animalId, string name, uint dna, uint species);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    uint speciesDigits = 1;
    uint speciesModulus = 10 ** speciesDigits;

    struct Animal {
        string name;
        uint dna;
        uint species;
    }

    Animal[] public animals;

    mapping (uint => address) public animalToOwner;
    mapping (address => uint) ownerAnimalCount;

    function _createAnimal(string _name, uint _dna, uint _species) private {
        uint id = animals.push(Animal(_name, _dna, _species)) - 1;
        animalToOwner[id] = msg.sender;
        ownerAnimalCount[msg.sender]++;
        emit NewAnimal(id, _name, _dna, _species);
    }

    function _generateRandomSpecies(string _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return randSpecies % speciesModulus;
    }

    function _generateRandomDna(string _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return randDna % dnaModulus;
    }

    function createRandomAnimal(string _name) public {
        require(ownerAnimalCount[msg.sender] == 0);
        uint randDna = _generateRandomDna(_name);
        _createAnimal(_name, randDna, randSpecies);
    }

function speciesModifier(uint _species) private returns(string) {

    if(_species = 0) {
        return bear;
    }
    else if (_species = 1) {
        return wolf;
    }
    else if (_species = 2) {
        return bird;
    }
    else if (_species = 3) {
        return lion;
    }
    else if (_species = 4) {
        return tiger;
    }
    else if (_species = 5) {
        return monkey;
    }
    else if (_species = 6) {
        return eagle;
    }
    else if (_species = 7) {
        return parrot;
    }
    else if (_species = 8) {
        return hippo;
    }
    else if (_species = 9) {
        return zombie;
    }

}
