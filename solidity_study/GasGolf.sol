// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.3;



contract GasGolf{
    // start -? //58227 gas
    // use calldata 56124gas // 배열의 memory -> calldata로 변경만 해도 가스비가 줄었다. 
    // load state variables to memory 55881gas 사용 전역으로있는 변수를 사용하지말고 내부변수를 만들어서 사용후 전역변수에 담아주기만 해도 gas비용이 줄어든다. 
    // short circuit  55516gas 위보다 300절약 변수를 반복해서 조건문을 주지말자 
    // loop increments i += 1 => ++i 55481gas
    // cache array length 55441gas 배열의 길이를 내부 변수에 담아서 반복문에 사용하기 
    // load array elements to memory 55255gas

    uint public total;
    
    //[1, 2, 3, 4, 5 100]
    function sumIfEvenAndLessThan99(uint[] calldata nums) external {
      uint _total = total;
      uint len = nums.length;
        for(uint i=0; i < len; ++i){
            // bool isEven = nums[i] % 2 == 0;
            // bool isLessThan99 = nums[i] < 99;
            uint num = nums[i];
            if(num % 2  == 0 && num < 99){
                _total += num;
            }
        }
        total = _total;
    }
}

//calldata vs memory 어떤 차이가 있는지 면밀하게 분석해