pragma solidity ^0.5.1;

//this storage contract allows for any number of variable to be created for proxy contract stuff.
contract Storage {

    mapping (string => uint256) _uintStorage;
    mapping (string => address) _addressStorage;
    mapping (string => bool) _boolStorage;
    mapping (string => string) _stringStorage;
    mapping (string => bytes4) _bytesStorage;
    /*
    _uintStorage["number"] = 10;
    _uintStorage["NrOfCats"] = 200;
    */

    address public owner;
    bool public _initialized;

}