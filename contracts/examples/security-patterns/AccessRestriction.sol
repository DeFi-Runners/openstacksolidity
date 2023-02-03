pragma solidity >=0.8.4;

import "../../ERC173OwnershipStandart.sol";

contract AccessRestriction is ERC173OwnershipStandart {
	error NoAccess();

	event Done();

	function execOnlyOwner() external {
		if (msg.sender != owner()) {
			revert NoAccess();
		}

		emit Done();
	}

	function execOnlyOwnerWithModifier() external onlyOwner {
		emit Done();
	}
}
