pragma solidity >=0.8.4;

import "./interfaces/IERC173.sol";
import "./ERC165.sol";

contract ERC173OwnershipStandart is IERC173, ERC165 {
    bytes4 internal constant ERC173_ID = 0x7f5828d0;

    address private _owner;

    constructor() {
        _setOwner(msg.sender);
        _setSupportedInterface(ERC173_ID);
    }

    function owner() public view returns (address account) {
        account = _owner;
    }

    function transferOwnership(address _newOwner) external onlyOwner {
        _setOwner(_newOwner);
    }

    function supportsInterface(bytes4 interfaceID) public view override returns (bool status) {
        status = super.supportsInterface(interfaceID);
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
