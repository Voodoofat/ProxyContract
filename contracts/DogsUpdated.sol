pragma solidity ^0.5.1;

import "./Storage.sol";

contract DogsUpdated is Storage{

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    constructor() public {
        initialize(msg.sender);
    }

    //this should run only once
    function initialize(address _owner) public {
        require(!_initialized);
        owner = _owner;
        _initialized = true;
    }

    function getNumberOfDogs() public view returns(uint256) {
        return _uintStorage["Dogs"];
    }

    function setNumberOfDogs(uint256 toSet) public onlyOwner {
        _uintStorage["Dogs"] = toSet;
    }
    /* this would create a new variable Cats within the uintStorage
    function setNumberOfCats(uint256 toSet) public {
        _uintStorage["Cats"] = toSet;
    }
    */
}