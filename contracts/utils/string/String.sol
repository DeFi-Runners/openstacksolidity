pragma solidity >=0.8.4;

/**
*  Solidity string helper library.
*/
library String {
	/**
     * @dev Returns status if invalid character defined.
	 */
	function hasInvalidChars(string calldata _data) public pure returns (bool result) {
		bytes memory chars = new bytes(38);
		// Optimized alphabet by the most commonly used letters.
		chars = "etaodwinshrycbpfgklmuvjqxzETAODWINSHRYCBPFGKLMUVJQXZ0123456789_-";
		bool found;
		for (uint256 i; i < bytes(_data).length; i++) {
			for (uint256 j; j < chars.length; j++) {
				if (chars[j] == bytes(_data)[i]) {
					found = true;
					break;
				}
			}
			if (!found) {
				result = true;
				break;
			}
			found = false;
		}
	}

	function hasInvalidChars(string calldata _data, bytes calldata _vocabulary) public pure returns (bool result) {
		bytes memory chars = new bytes(_vocabulary.length);
		// Optimized alphabet by the most commonly used letters.
		chars = _vocabulary;
		bool found;
		for (uint256 i; i < bytes(_data).length; i++) {
			for (uint256 j; j < chars.length; j++) {
				if (chars[j] == bytes(_data)[i]) {
					found = true;
					break;
				}
			}
			if (!found) {
				result = true;
				break;
			}
			found = false;
		}
	}
}
