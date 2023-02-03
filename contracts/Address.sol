pragma solidity >=0.8.4;

library Address {
	address public constant BLACKHOLE_ADDRESS = address(0);
	address public constant DEAD_ADDRESS = address(0xdead);

	function isContract(address account) internal view returns (bool status) {
		status = account.code.length > 0;
	}

	function isBlackHole(address account) internal pure returns (bool status) {
		status = account == BLACKHOLE_ADDRESS;
	}

	function isDeadAddress(address account) internal pure returns (bool status) {
		status = account == DEAD_ADDRESS;
	}
}
