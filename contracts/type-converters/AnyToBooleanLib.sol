pragma solidity >=0.8.4;

library AnyToBooleanLib {
    // int8 to string
    function toBoolean(int8 _value) public pure returns (bool result) {
        result = _value > 0;
    }

    // int16 to string
    function toBoolean(int16 _value) public pure returns (bool result) {
        result = _value > 0;
    }

    // int32 to string
    function toBoolean(int32 _value) public pure returns (bool result) {
        result = _value > 0;
    }

    // int64 to string
    function toBoolean(int64 _value) public pure returns (bool result) {
        result = _value > 0;
    }

    // int128 to string
    function toBoolean(int128 _value) public pure returns (bool result) {
        result = _value > 0;
    }

    // int256 to string
    function toBoolean(int256 _value) public pure returns (bool result) {
        result = _value > 0;
    }

    // uint8 to string
    function toBoolean(uint8 _value) public pure returns (bool result) {
        result = _value != 0;
    }

    // uint16 to string
    function toBoolean(uint16 _value) public pure returns (bool result) {
        result = _value != 0;
    }

    // uint32 to string
    function toBoolean(uint32 _value) public pure returns (bool result) {
        result = _value != 0;
    }

    // uint64 to string
    function toBoolean(uint64 _value) public pure returns (bool result) {
        result = _value != 0;
    }

    // uint128 to string
    function toBoolean(uint128 _value) public pure returns (bool result) {
        result = _value != 0;
    }

    // uint256 to string
    function toBoolean(uint256 _value) public pure returns (bool result) {
        result = _value != 0;
    }

    // bytes2 to string
    function toBoolean(bytes2 _value) public pure returns (bool result) {
        result = keccak256(abi.encodePacked(_value)) != keccak256(abi.encodePacked(bytes2("")));
    }

    // bytes4 to string
    function toBoolean(bytes4 _value) public pure returns (bool result) {
        result = keccak256(abi.encodePacked(_value)) != keccak256(abi.encodePacked(bytes4("")));
    }

    // bytes8 to string
    function toBoolean(bytes8 _value) public pure returns (bool result) {
        result = keccak256(abi.encodePacked(_value)) != keccak256(abi.encodePacked(bytes8("")));
    }

    // bytes8 to string
    function toBoolean(bytes16 _value) public pure returns (bool result) {
        result = keccak256(abi.encodePacked(_value)) != keccak256(abi.encodePacked(bytes16("")));
    }

    // bytes32 to string
    function toBoolean(bytes32 _value) public pure returns (bool result) {
        result = keccak256(abi.encodePacked(_value)) != keccak256(abi.encodePacked(bytes32("")));
    }

    function toBoolean(bytes memory _data) public pure returns (bool result) {
        result = keccak256(abi.encodePacked(_data)) != keccak256(abi.encodePacked(bytes("")));
    }
}
