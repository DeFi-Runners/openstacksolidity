pragma solidity >=0.8.4;

library AnyToStringLib {
	// address to string
	function toString(address _account) public pure returns (string memory result) {
		result = toString(abi.encodePacked(_account));
	}

	// @error TypeError: Function overload clash during conversion to external types for arguments.
	//	// address payable to string
	//	function toString(address payable __account) public pure returns (string memory result) {
	//		result = toString(abi.encodePacked(__account));
	//	}

	// boolean to string
	function toString(bool _data) public pure returns (string memory result) {
		result = toString(abi.encodePacked(_data));
	}

	// int8 to string
	function toString(int8 _value) public pure returns (string memory result) {
		result = toString(abi.encodePacked(_value));
	}

	// int16 to string
	function toString(int16 _value) public pure returns (string memory result) {
		result = toString(abi.encodePacked(_value));
	}

	// int32 to string
	function toString(int32 _value) public pure returns (string memory result) {
		result = toString(abi.encodePacked(_value));
	}

	// int64 to string
	function toString(int64 _value) public pure returns (string memory result) {
		result = toString(abi.encodePacked(_value));
	}

	// int128 to string
	function toString(int128 _value) public pure returns (string memory result) {
		result = toString(abi.encodePacked(_value));
	}

	// int256 to string
	function toString(int256 _value) public pure returns (string memory result) {
		result = toString(abi.encodePacked(_value));
	}

	// uint8 to string
	function toString(uint8 _value) public pure returns (string memory result) {
		result = toString(abi.encodePacked(_value));
	}

	// uint16 to string
	function toString(uint16 _value) public pure returns (string memory result) {
		result = toString(abi.encodePacked(_value));
	}

	// uint32 to string
	function toString(uint32 _value) public pure returns (string memory result) {
		result = toString(abi.encodePacked(_value));
	}

	// uint64 to string
	function toString(uint64 _value) public pure returns (string memory result) {
		result = toString(abi.encodePacked(_value));
	}

	// uint128 to string
	function toString(uint128 _value) public pure returns (string memory result) {
		result = toString(abi.encodePacked(_value));
	}

	// uint256 to string
	function toString(uint256 _value) public pure returns (string memory result) {
		result = toString(abi.encodePacked(_value));
	}

	// bytes2 to string
	function toString(bytes2 _value) public pure returns (string memory result) {
		result = toString(abi.encodePacked(_value));
	}

	// bytes4 to string
	function toString(bytes4 _value) public pure returns (string memory result) {
		result = toString(abi.encodePacked(_value));
	}

	// bytes8 to string
	function toString(bytes8 _value) public pure returns (string memory result) {
		result = toString(abi.encodePacked(_value));
	}

	// bytes8 to string
	function toString(bytes16 _value) public pure returns (string memory result) {
		result = toString(abi.encodePacked(_value));
	}

	// bytes32 to string
	function toString(bytes32 _value) public pure returns (string memory result) {
		result = toString(abi.encodePacked(_value));
	}

	function toString(bytes memory _data) public pure returns (string memory result) {
		bytes memory alphabet = "0123456789abcdef";
		bytes memory str = new bytes(2 + _data.length * 2);
		str[0] = "0";
		str[1] = "x";
		for (uint256 i; i < _data.length; i++) {
			str[2+i*2] = alphabet[uint256(uint8(_data[i] >> 4))];
			str[3+i*2] = alphabet[uint256(uint8(_data[i] & 0x0f))];
		}
		result = string(str);
	}
}
