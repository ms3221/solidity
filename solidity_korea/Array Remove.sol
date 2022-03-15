// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


contract ArrayShift {
    uint[] public arr;

    function example() public {
       arr = [1,2,3];
       delete arr[1]; // [1,0,3]
    }
    
    // [1,2,3] -> remove(1) -> [1,3,3] ->[1, 3]
    // 결국 배열에서 요소를 삭제하기 위해서는 배열요소를 왼쪽으로 이동한 다음 마지막 요소를 제거합니다.
    // remove array element by shifting elements to left;
    function remove(uint _index) public {
      require(_index < arr.length, "index out of bound");
      for(uint i=0; i<arr.length-1; i++){
          arr[i] = arr[i+1];
      }
      arr.pop();
    }

    function test() external {
        arr = [1,2,3,4,5];
        remove(2); //[1,2,4,5];
        assert(arr[0]==1);
        assert(arr[1]==2);
        assert(arr[2]==4);
        assert(arr[3]==5);
        assert(arr.length == 4);
    } 

   
}

// [1,2,3,4] --> remove(1) --> [1,4,3];
// [1,4,3] --> remove(2) --> [1, 4];
// gas비를 좀더 절약할 수 있다.
contract ArrayReplaceLast{
    uint[] public arr;

    function remove(uint _index) public {
        arr[_index] = arr[arr.length-1];
        arr.pop();
    }
    
   function test() external {
       arr = [1,2,3,4];

       remove(1);
        assert(arr[0]==1);
        assert(arr[1]==4);
        assert(arr[2]==3);
         
   }
   function output() external view returns(uint[] memory){
      
      return arr;
   }
}