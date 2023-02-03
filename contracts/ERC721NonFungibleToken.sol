pragma solidity >=0.8.4;

import "./interfaces/IERC721.sol";
import "./interfaces/IERC721TokenReceiver.sol";
import "./interfaces/IERC165.sol";
import "./Address.sol";
import "./LowLevel.sol";
import "./interfaces/IERC721Metadata.sol";
import "./interfaces/IERC721Enumerable.sol";

contract ERC721 is IERC721, IERC721Metadata, IERC721Enumerable {
	bytes4 constant internal TOKEN_RECEIVER_ID = 0x150b7a02;

	string internal _name;
	string internal _symbol;
	uint256 internal _totalSupply;

	// account -> list<tokenId>
	mapping(address => uint256[]) internal _balances;
	// account -> tokenId -> position
	mapping(address => mapping(uint256 => uint256)) internal _tokenIdPosition;
	// tokenId -> account
	mapping(uint256 => address) internal _ownerOf;
	// account resolver -> tokenId -> account spender
	mapping(address => mapping(uint256 => address)) internal _approved;
	// account resolver -> account spender -> bool
	mapping(address => mapping(address => bool)) internal _approvedForAll;

	constructor(string memory name_, string memory symbol_) {
		_name = name_;
		_symbol = symbol_;
	}

	function name() external view returns (string memory) {
		return _name;
	}

	/// @notice An abbreviated name for NFTs in this contract
	function symbol() external view returns (string memory) {
		return _symbol;
	}

	/// @notice A distinct Uniform Resource Identifier (URI) for a given asset.
	/// @dev Throws if `_tokenId` is not a valid NFT. URIs are defined in RFC
	///  3986. The URI may point to a JSON file that conforms to the "ERC721
	///  Metadata JSON Schema".
	function tokenURI(uint256 _tokenId) external view returns (string memory path) {
		///
	}

	function totalSupply() external view returns (uint256 amount) {
		amount = _totalSupply;
	}

	function tokenByIndex(uint256 _index) external view returns (uint256 tokenId) {
		revert("Not implemented");
	}

	function tokenOfOwnerByIndex(address _owner, uint256 _index) external view returns (uint256 tokenId) {
		tokenId = _balances[_owner][_index];
	}

	// done
	function balanceOf(address _owner) external view returns (uint256 balance) {
		balance = _balances[_owner].length;
	}

	// done
	function ownerOf(uint256 _tokenId) external view returns (address account) {
		account = _ownerOf[_tokenId];
	}

	function getApproved(uint256 _tokenId) external view returns (address account) {
		account = _approved[_ownerOf[_tokenId]][_tokenId];
	}

	function isApprovedForAll(address _owner, address _operator) external view returns (bool status) {
		status = _approvedForAll[_owner][_operator];
	}

	function transferFrom(address _from, address _to, uint256 _tokenId) external {
		_transfer(_from, _to, _tokenId);
	}

	function safeTransferFrom(address _from, address _to, uint256 _tokenId) external {
		_safeTransferFrom(_from, _to, _tokenId, "0x");
	}

	function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes calldata _data) external {
		_safeTransferFrom(_from, _to, _tokenId, _data);
		LowLevel.call(_to, _data);
	}

	// _approved address(0) to remove allowance.
	function approve(address _to, uint256 _tokenId) external payable {
		_approved[msg.sender][_tokenId] = _to;
		emit Approval(msg.sender, _to, _tokenId);
	}

	// done
	function setApprovalForAll(address _operator, bool _status) external {
		_approvedForAll[msg.sender][_operator] = _status;
		emit ApprovalForAll(msg.sender, _operator, _status);
	}

	function _transfer(address _from, address _to, uint256 _tokenId) internal {
		uint256 index = _tokenIdPosition[_from][_tokenId];

		_balances[_from][index] = _balances[_from][_balances[_from].length-1];
		_balances[_from].pop();
		_tokenIdPosition[_from][_balances[_from][index]] = index;

		_balances[_to].push(_tokenId);
		_tokenIdPosition[_to][_tokenId] = _balances[_to].length-1;
		_ownerOf[_tokenId] = _to;
		emit Transfer(_from, _to, _tokenId);
	}

	function _safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes memory _data) internal {
		_transfer(_from, _to, _tokenId);
		if (Address.isContract(_to)) {
			try IERC165(_to).supportsInterface(TOKEN_RECEIVER_ID) returns (bool status) {
				if (!status) {
					try IERC721TokenReceiver(_to).onERC721Received(msg.sender, _from, _tokenId, _data) returns (bytes4 sig) {
						require(sig == TOKEN_RECEIVER_ID, "TOKEN_RECEIVER interface not supported");
					} catch Error(string memory err) {
						revert("onERC721Received method not implemented");
					}
				}
			} catch Error(string memory err) {
				revert("supportsInterface method not implemented");
			}
		}
	}

	function _mint(address _to, uint256 _tokenId) internal {
		require(_ownerOf[_tokenId] == address(0), "ERC721: token already exists");

		_balances[_to].push(_tokenId);
		_tokenIdPosition[_to][_tokenId] = _balances[_to].length-1;
		_ownerOf[_tokenId] = _to;
		_totalSupply++;
		emit Transfer(address(0), _to, _tokenId);
	}

	function _burn(address _from, uint256 _tokenId) internal {
		require(_from == msg.sender, "ERC721: only token owner");

		uint256 index = _tokenIdPosition[_from][_tokenId];

		_balances[_from][index] = _balances[_from][_balances[_from].length-1];
		_balances[_from].pop();
		_tokenIdPosition[_from][_balances[_from][index]] = index;
		_ownerOf[_tokenId] = address(0);
		_totalSupply--;
		emit Transfer(_from, address(0), _tokenId);
	}
}
