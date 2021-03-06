//SPDX-License-Identifier: Unlicense

// contracts/BuyMeACoffee.sol
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/access/Ownable.sol";

// Switch this to your own contract address once deployed, for bookkeeping!
// Contract Address on Goerli: 0xbC3DcF1f3Edfc7Ee80d78EcA2982C5Be84B31450
// Contract Address on Goerli (with Challenges Implemented): 0xCA8A7cEfA55B2fb30cf74D8e1eE3221F00169f39
contract BuyMeACoffee is Ownable {
    // Event to emit when a Memo is created.
    event NewMemo(
        address indexed from,
        uint256 timestamp,
        string name,
        string message
    );
    
    // Memo struct.
    struct Memo {
        address from;
        uint256 timestamp;
        string name;
        string message;
    }

    // Withdraw Address, Marked payable so that
    // we can withdraw to this address later.
    address payable withdrawAddress;

    // List of all memos received from coffee purchases.
    Memo[] memos;

    constructor() {
        // Store the address of the deployer as a payable address.
        // When we withdraw funds, we'll withdraw here.
        withdrawAddress = payable(msg.sender);
    }

    /**
     * @dev fetches all stored memos
     */
    function getMemos() public view returns (Memo[] memory) {
        return memos;
    }

    /**
     * @dev buy a coffee for owner (sends an ETH tip and leaves a memo)
     * @param _name name of the coffee purchaser
     * @param _message a nice message from the purchaser
     */
    function buyCoffee(string memory _name, string memory _message) public payable {
        // Must accept more than 0 ETH for a coffee.
        require(msg.value > 0, "can't buy coffee for free!");

        // Add the memo to storage!
        memos.push(Memo(
            msg.sender,
            block.timestamp,
            _name,
            _message
        ));

        // Emit a NewMemo event with details about the memo.
        emit NewMemo(
            msg.sender,
            block.timestamp,
            _name,
            _message
        );
    }

    /**
     * @dev send the entire balance stored in this contract to the owner
     */
    function withdrawTips() public {
        require(withdrawAddress.send(address(this).balance));
    }

    /**
     * @dev only contract owner can set withdrawAddress
     */
    function setWithdrawAddress(address withdrawTo) public onlyOwner{
        require(msg.sender == owner());
        withdrawAddress = payable(withdrawTo);
    }
}