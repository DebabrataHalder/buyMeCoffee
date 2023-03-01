//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;


//deploied to Goerli at 0xa4509F36a012316f74B0Adf40C6d7515d9c435b5

contract BuyMeACoffee{

    event NewMemo(
        address indexed from,
        uint256 timestamp,
        string name,
        string message

    );
    struct Memo{
        address from;
        uint256 timestamp;
        string name;
        string message;
    }
    Memo[] memos;

    address payable owner;

    constructor(){
        owner= payable(msg.sender);
    }

    function buyCoffee(string memory _name , string memory _message ) public payable{
        require(msg.value>0,"Can't  buy coffee with 0 ETH");
        memos.push(Memo(
            msg.sender,
            block.timestamp,
            _name,
            _message            

        ));
        emit NewMemo(
            msg.sender,
            block.timestamp,
            _name,
            _message
        );
    }

    function withdrawTips() public payable{
        require(owner.send(address(this).balance));
    }
    function getMemos() public view returns(Memo[] memory){
        return memos;
    }
}










