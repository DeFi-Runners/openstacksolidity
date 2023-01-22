pragma solidity >=0.8.4;

library AnyToStringLib {
    // address to string
    function toBytes(address _account) public pure returns (bytes memory result) {
        result = toBytes(abi.encodePacked(_account));
    }

    // @error TypeError: Function overload clash during conversion to external types for arguments.
    //	// address payable to bytes
    //	function toBytes(address payable __account) public pure returns (bytes memory result) {
    //		result = toBytes(abi.encodePacked(__account));
    //	}

    // boolean to string
    function toBytes(bool _data) public pure returns (bytes memory result) {
        result = toBytes(abi.encodePacked(_data));
    }

    // int8 to string
    function toBytes(int8 _value) public pure returns (bytes memory result) {
        result = toBytes(abi.encodePacked(_value));
    }

    // int16 to string
    function toBytes(int16 _value) public pure returns (bytes memory result) {
        result = toBytes(abi.encodePacked(_value));
    }

    // int32 to string
    function toBytes(int32 _value) public pure returns (bytes memory result) {
        result = toBytes(abi.encodePacked(_value));
    }

    // int64 to string
    function toBytes(int64 _value) public pure returns (bytes memory result) {
        result = toBytes(abi.encodePacked(_value));
    }

    // int128 to string
    function toBytes(int128 _value) public pure returns (bytes memory result) {
        result = toBytes(abi.encodePacked(_value));
    }

    // int256 to string
    function toBytes(int256 _value) public pure returns (bytes memory result) {
        result = toBytes(abi.encodePacked(_value));
    }

    // uint8 to string
    function toBytes(uint8 _value) public pure returns (bytes memory result) {
        result = toBytes(abi.encodePacked(_value));
    }

    // uint16 to string
    function toBytes(uint16 _value) public pure returns (bytes memory result) {
        result = toBytes(abi.encodePacked(_value));
    }

    // uint32 to string
    function toBytes(uint32 _value) public pure returns (bytes memory result) {
        result = toBytes(abi.encodePacked(_value));
    }

    // uint64 to string
    function toBytes(uint64 _value) public pure returns (bytes memory result) {
        result = toBytes(abi.encodePacked(_value));
    }

    // uint128 to string
    function toBytes(uint128 _value) public pure returns (bytes memory result) {
        result = toBytes(abi.encodePacked(_value));
    }

    // uint256 to string
    function toBytes(uint256 _value) public pure returns (bytes memory result) {
        result = toBytes(abi.encodePacked(_value));
    }

    // bytes2 to string
    function toBytes(bytes2 _value) public pure returns (bytes memory result) {
        result = toBytes(abi.encodePacked(_value));
    }

    // bytes4 to string
    function toBytes(bytes4 _value) public pure returns (bytes memory result) {
        result = toBytes(abi.encodePacked(_value));
    }

    // bytes8 to string
    function toBytes(bytes8 _value) public pure returns (bytes memory result) {
        result = toBytes(abi.encodePacked(_value));
    }

    // bytes8 to string
    function toBytes(bytes16 _value) public pure returns (bytes memory result) {
        result = toBytes(abi.encodePacked(_value));
    }

    // bytes32 to string
    function toBytes(bytes32 _value) public pure returns (bytes memory result) {
        result = toBytes(abi.encodePacked(_value));
    }

    function toBytes(bytes memory _data) public pure returns (bytes memory result) {
        result = _data;
    }
}
