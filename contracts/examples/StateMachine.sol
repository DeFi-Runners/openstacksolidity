pragma solidity >=0.8.4;

enum State {
	CLOSED,
	OPEN
}

contract StateMachine {
	State private _state;

	error IncorrectState();

	event Done();

	function setState(State _status) external {
		_state = _status;
	}

	function getState() external view returns (State status) {
		status = _state;
	}

	function execWhenClosed() external atState(State.CLOSED) {
		emit Done();
	}

	function execWhenOpen() external atState(State.OPEN) {
		emit Done();
	}

	modifier atState(State _status) {
		if (_state != _status) revert IncorrectState();
		_;
	}
}
