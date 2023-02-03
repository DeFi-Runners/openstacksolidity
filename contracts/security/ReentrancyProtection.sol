pragma solidity >=0.8.4;

contract ReentrancyProtection {
	error ReentrancyCall();

	bool private constant _NOT_ENTERED = false;
	bool private constant _ENTERED = true;
	// reentrancy protected normal state
	bool private _reentrancyStatus;

	modifier withReentrancyCheck() {
		// On the first call to nonReentrant, _status will be _NOT_ENTERED
		if (_reentrancyStatus == _ENTERED) revert ReentrancyCall();

		// Any calls to nonReentrant after this point will fail
		_reentrancyStatus = _ENTERED;
		_;
		_reentrancyStatus = _NOT_ENTERED;
	}
}
