// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;



contract ForAndWhileLoops {
    function loops() external pure {
       for(uint i=0; i< 10; i++){
           if( i == 3){
               continue;
           }

           if( i == 5 ){
               break;
           }
       }

       uint j = 0;
       while (j < 10){
           j++;
       }
    }
    //JS로 100만번 돌려도 문제가 되지않지만 
    //루프수가 많을 수록 더많은 가스를 사용할 것이다.  필요없는 반보을 줄여서 가스비를 절감시켜라!! 
    function sum(uint _n) external pure returns (uint){
        uint s;
        for(uint i=0; i<=_n; i++){
            s += i;
        }

        return s;
    }
}