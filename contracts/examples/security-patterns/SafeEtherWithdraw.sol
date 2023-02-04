pragma solidity >=0.8.4;

import "../../LowLevel.sol";

contract SafeEtherWithdraw {
	uint256 public balance;

	receive() external payable {
		unchecked {
			balance += msg.value;
		}
	}

	function deposit() external payable {
		unchecked {
			balance += msg.value;
		}
	}

	function withdraw(address _recipient, uint256 _amount) external {
		require(balance >= _amount, "Address: insufficient balance");

		unchecked {
			balance -= _amount;
		}
		LowLevel.call(_recipient, _amount);
	}
}
