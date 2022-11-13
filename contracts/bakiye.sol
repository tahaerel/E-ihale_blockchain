// SPDX-License-Identifier: MIT
 pragma solidity ^0.8.1;

 contract Bakiye{
     string bakiye_miktar;

    function setBakiye(string memory _bakiye_miktar) public{
        bakiye_miktar = _bakiye_miktar;
    }

    function getBakiye() public view returns(string memory){
        return bakiye_miktar;
    }

}