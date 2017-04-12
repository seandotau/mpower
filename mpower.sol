pragma solidity ^0.4.0;

contract Mpower {
    mapping (address => uint) balanceAccount;
    mapping (address => uint) topupAmount;
    uint public billedAmount;
    uint public lastTopupAmount;
    
    address public owner;
    uint public rateKWH = 26; //$0.26 per kwh
    
    function topup(uint topupAmount) public {
        balanceAccount[msg.sender] += topupAmount;
        lastTopupAmount = topupAmount;
    }
    
    function getLastTopupAmount() returns (uint lasttopup) {
        return lastTopupAmount;
    }
    
    function getBalance() returns (uint balance){
        return balanceAccount[msg.sender];
    }
    
    function billUser(uint usageKWH) returns (uint usageBill){
        billedAmount = usageKWH*rateKWH;
        return balanceAccount[msg.sender] -= usageKWH*rateKWH;
    }
    
    function getBilledAmount() returns (uint billedamount){
        return billedAmount;
    }
    
}