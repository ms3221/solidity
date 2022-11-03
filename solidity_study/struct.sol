// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


contract Structs {
    struct Car {
        string model;
        uint year;
        address owner;
    }

    Car public car;
    Car[] public cars;
    mapping(address => Car[]) public carsByOwner;

    function examples() external {
       //구조체를 초기화하는 3가지 방법 memory는 함수가 구동할때만 데이터를 가지고 있고 함수가 종료되면 데이터가 사라집니다.        
        Car memory toyota = Car("Toyota", 1990, msg.sender);
        Car memory lambo = Car({ year:1980, model:"Lamborghini", owner:msg.sender});
        Car memory tesla;
        tesla.model = "Tesla";
        tesla.year = 2010;
        tesla.owner = msg.sender;

        //그러기에 우리는 cars배열에 구조체를 넣어줄 것입니다.
        cars.push(toyota);
        cars.push(lambo);
        cars.push(tesla);

        //꼭 구조체를 초기화시킨다음 배열에 넣어주는 방식으로 하는것은 아닙니다. 
        // 바로 배열에 구조체를 넣어줄수도 있습니다.
        cars.push(Car("Ferrari",2020,msg.sender));
       

       //초기화가 진행되고 배열에 저장을 했으면 어떻게 읽어오고 데이터를 변환시킬까요?
       Car storage _car = cars[0];
       _car.year = 1999;
       delete _car.owner;

       delete cars[1];
    }  
}