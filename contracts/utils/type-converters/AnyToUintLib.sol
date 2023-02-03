pragma solidity >=0.8.4;

library AnyToUintLib {
    // address to string
    function toUint(address _account) public pure returns (uint256 result) {
        result = toUint(abi.encodePacked(_account));
    }

    // @error TypeError: Function overload clash during conversion to external types for arguments.
    //	// address payable to bytes
    //	function toUint(address payable __account) public pure returns (uint256 result) {
    //		result = toUint(abi.encodePacked(__account));
    //	}

    // boolean to string
    function toUint(bool _data) public pure returns (uint256 result) {
        result = toUint(abi.encodePacked(_data));
    }

    // int8 to string
    function toUint(int8 _value) public pure returns (uint256 result) {
        result = toUint(abi.encodePacked(_value));
    }

    // int16 to string
    function toUint(int16 _value) public pure returns (uint256 result) {
        result = toUint(abi.encodePacked(_value));
    }

    // int32 to string
    function toUint(int32 _value) public pure returns (uint256 result) {
        result = toUint(abi.encodePacked(_value));
    }

    // int64 to string
    function toUint(int64 _value) public pure returns (uint256 result) {
        result = toUint(abi.encodePacked(_value));
    }

    // int128 to string
    function toUint(int128 _value) public pure returns (uint256 result) {
        result = toUint(abi.encodePacked(_value));
    }

    // int256 to string
    function toUint(int256 _value) public pure returns (uint256 result) {
        result = toUint(abi.encodePacked(_value));
    }

    // uint8 to string
    function toUint(uint8 _value) public pure returns (uint256 result) {
        result = toUint(abi.encodePacked(_value));
    }

    // uint16 to string
    function toUint(uint16 _value) public pure returns (uint256 result) {
        result = toUint(abi.encodePacked(_value));
    }

    // uint32 to string
    function toUint(uint32 _value) public pure returns (uint256 result) {
        result = toUint(abi.encodePacked(_value));
    }

    // uint64 to string
    function toUint(uint64 _value) public pure returns (uint256 result) {
        result = toUint(abi.encodePacked(_value));
    }

    // uint128 to string
    function toUint(uint128 _value) public pure returns (uint256 result) {
        result = toUint(abi.encodePacked(_value));
    }

    // uint256 to string
    function toUint(uint256 _value) public pure returns (uint256 result) {
        result = toUint(abi.encodePacked(_value));
    }

    // bytes2 to string
    function toUint(bytes2 _value) public pure returns (uint256 result) {
        result = toUint(abi.encodePacked(_value));
    }

    // bytes4 to string
    function toUint(bytes4 _value) public pure returns (uint256 result) {
        result = toUint(abi.encodePacked(_value));
    }

    // bytes8 to string
    function toUint(bytes8 _value) public pure returns (uint256 result) {
        result = toUint(abi.encodePacked(_value));
    }

    // bytes8 to string
    function toUint(bytes16 _value) public pure returns (uint256 result) {
        result = toUint(abi.encodePacked(_value));
    }

    // bytes32 to string
    function toUint(bytes32 _value) public pure returns (uint256 result) {
        result = toUint(abi.encodePacked(_value));
    }

    function toUint(bytes memory _data) public pure returns (uint256 result) {
        for (uint256 i; i < _data.length; i++) {
            result = result + uint(uint8(_data[i])) * (2 ** (8 * (_data.length - (i + 1))));
        }
    }
}
