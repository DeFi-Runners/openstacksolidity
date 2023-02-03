pragma solidity >=0.8.4;

library LowLevel {
	error CallReverted();
	error StaticCallReverted();
	error DelegateCallReverted();

	function call(address _recipient, bytes memory _data) public returns (bool success, bytes memory result) {
		(success, result) = _recipient.call(_data);
		if (!success)
			revert CallReverted();
	}

	function call(address _recipient, uint256 _value) public returns (bool success, bytes memory result) {
		(success, result) = _recipient.call{value: _value}("");
		if (!success)
			revert CallReverted();
	}

	function call(address _recipient, uint256 _value, bytes memory _data) public returns (bool success, bytes memory result) {
		(success, result) = _recipient.call{value: _value}(_data);
		if (!success)
			revert CallReverted();
	}

	function staticcall(address _recipient, bytes memory _data) public returns (bool success, bytes memory result) {
		(success, result) = _recipient.staticcall(_data);
		if (!success)
			revert StaticCallReverted();
	}

	function delegatecall(address _recipient, bytes memory _data) public returns (bool success, bytes memory result) {
		(success, result) = _recipient.delegatecall(_data);
		if (!success)
			revert DelegateCallReverted();
	}
}
