


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

string constant costant = "1";

//Insert, update, read from array of structs
contract ToDoList{

struct Todo{
    string text;
    bool completed;
}

Todo[] public todos;

function create(string calldata _text) external{
    todos.push(Todo({
        text:_text,
        completed:false
    }));
}
function updateText(uint _index,string calldata _text) external {
    todos[_index].text = _text;
    // 위코드와 아래코드는 사실 동일한 기능을 하는 코드입니다.
    // 다만 변경해야할 값이 하나일 때는 위에가 더 좋고 
    // 구조체안에서 변견행해야하는 값이 많다면 아래가 좋습니다. 참고하세요  
    // 그이유는 구조체에 한번만 접근하냐 여러번 접근하냐의 차이이기 때문입니다.
    Todo storage todo = todos[_index];
    todo.text = _text;
}
function get(uint _index) external view returns(string memory,bool){
     Todo memory todo = todos[_index];
     return(todo.text, todo.completed);
}

}