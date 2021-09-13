const MultiNumberBettingV5 = artifacts.require("MultiNumberBettingV5");

/**
 * Test Case
 * 1. Lets say John is the dealer - so he is the one running the contract
 * 2. Check the initial ether balance for Frank 
 * 3. Bill puts in a losing guess (8) with 3 ethers
 * 4. Frank puts in a winning bid (3) with 1 ethers
 * 5. Frank should have balance > his initial balance checked in step#2
 * 
 * PS:
 * a. Multiple runs will cause Franks balance to increase
 * b. Frank's balance will not be a full ether caz he is paying for gas, Number(result)
 ,{from:bills_address, value:sendValue}
 ,{from:franks_address, value:sendValue}
 */

contract('MultiNumberBettingV5', function(accounts) {
  var johns_address = accounts[0];
  var bills_address = accounts[1];
  var franks_address= accounts[2];
  
  it("should assert true", function() {
    var multi_number_betting_v5;
    return MultiNumberBettingV5.deployed().then(function(instance){
      multi_number_betting_v5 = instance;

      return web3.eth.getBalance(bills_address);
    }).then(function(result){
      // Print contract balance
      console.log(' Bill Initial  balance : ',web3.utils.fromWei(result,'ether'));

      // Send a losing guess from Bill (to generate enough ethers to give winner)
      var sendValue = web3.utils.toWei('3','ether');
      
      //console.log(typeof sendValue);
      multi_number_betting_v5.guess(8, "Frank Smith", {from: franks_address, value: sendValue});
     

      // Send a winning guess from Frank
      var sendValue = web3.utils.toWei('2','ether');
      //web3.eth.sendTransaction({from:franks_address,to:multi_number_betting_v5.address, value:sendValue});
      multi_number_betting_v5.guess(5,"Bill Tale", {from: bills_address, value:sendValue});

      // Get the last winner name
      return multi_number_betting_v5.getLastWinnerInfo.call();
    }).then(function(result){

      console.log("Last Winner: ", result[1]);
      return web3.eth.getBalance(bills_address);

    }).then(function(result){
      console.log("Bills final balance : ");
      console.log(web3.utils.fromWei(result,'ether'));
    });
  });
  
});
