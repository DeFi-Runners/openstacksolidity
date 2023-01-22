pragma solidity >=0.8.4;

import "./interfaces/IERC173.sol";
import "./interfaces/IERC165.sol";

contract ERC173OwnershipStandart is IERC173, IERC165 {
    address private _owner;

    function owner() external view returns (address account) {
        account = _owner;
    }

    function transferOwnership(address _newOwner) external onlyOwner {
        _setOwner(_newOwner);
    }

    function supportsInterface(bytes4 interfaceID) external view returns (bool status) {
        status = interfaceID == 0x7f5828d0;
    }

    function _setOwner(address _account) internal {
        address __owner = _owner;
        _owner = _account;
        emit OwnershipTransferred(__owner, _account);
    }

    modifier onlyOwner() {
        require(msg.sender == _owner, "ERC173: Not owner");
        _;
    }
}
