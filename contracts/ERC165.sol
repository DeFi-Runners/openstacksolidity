pragma solidity >=0.8.4;

import "./interfaces/IERC165.sol";

contract ERC165 is IERC165 {
	bytes4 constant INVALID_ID = 0xffffffff;
	bytes4 constant ERC165_ID = 0x01ffc9a7;

	/// @dev You must not set element 0xffffffff to true
	mapping(bytes4 => bool) internal _supportedInterfaces;

	function supportsInterface(bytes4 _interfaceID) external view returns (bool status) {
		if (_interfaceID != INVALID_ID) {
			status = _interfaceID == ERC165_ID || _supportedInterfaces[_interfaceID]; // ERC165.supportsInterface.selector
		}
	}

	// Returns signature. Example `_method`: "exec(address,uint256)".
	function calculateInterfaceIdentifier(string calldata _method) external pure returns (bytes4 result) {
		result = bytes4(keccak256(abi.encodePacked(_method)));
	}

	function _setSupportedInterface(bytes4 _interfaceID) internal {
		require(_interfaceID != INVALID_ID, "ERC165: invalid id");

		_supportedInterfaces[_interfaceID] = true;
	}
}
