/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import '../node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol';
import '../node_modules/@openzeppelin/contracts/utils/math/SafeMath.sol';



contract Union{


using SafeMath for uint256;

/*
 Union 컨트랙트에서는 Union이 여러가지 투표안건을 만들 수 있고 투표할 수 있는 컨트랙트입니다. 

------  변수명 설명 ------
Proposals -> Union Member들이 투표할 수 있는 여러제안들입니다. 
suggestion -> 하나의 제안이며 투표할 수 있습니다. 
Voter -> suggestion에 투표하는 union Member 각 한명의 구조체입니다. 
*/


address public chairperson;
IERC20 token;
string public unionName;
uint public suggestionNo;
mapping (string => uint) findSuggestionNo;
Suggestion[] public suggestions; 
string[] public subjects;
mapping(address => uint) public votePower;



  struct Suggestion {
       
        string subject;
        uint suggestionNo;
        Voter[] unionMember;
        uint totalAmount;
        bool status;
        
    }


  struct Voter {
        string suggestion;
        address addr;
        uint256 asset;
        bool voted;
        string answer;
    }


    constructor(string memory _unionName,address owner, address Ierc0Address){
       chairperson = owner;
       unionName = _unionName;
       token = IERC20(Ierc0Address);
    }

 

/*
  @param 
  subject -> 어떤 주제로 안건을 만들것인지
*/
function createOneSuggestion(string memory _subject) external {
     Suggestion storage suggestion = suggestions.push();
     suggestion.subject = _subject;
     suggestion.suggestionNo = suggestionNo;
     suggestion.status = true;
     suggestion.totalAmount = 0;
     findSuggestionNo[_subject] = suggestionNo;
     subjects.push(_subject);
     suggestionNo++;
}


     //중복투표 및 제안서를 낸 사람을 미리 check해주는 modifier
     modifier validVoter(string memory _subject,address voter){
        Suggestion storage singleSuggestion = suggestions[findSuggestionNo[_subject]];
         for(uint i=0; i<singleSuggestion.unionMember.length; i++){
             if(singleSuggestion.unionMember[i].addr == voter){
               require(singleSuggestion.unionMember[i].voted == false, "voter already voted"); 
             }
         }
        require(voter != chairperson, "chairperson is not alrigth");
        _;
    }

   /// 3.투표하는 함수
     function vote (string memory _subject, string memory _answer,uint _amount) public payable validVoter(_subject,msg.sender) {
        Suggestion storage singleSuggestion = suggestions[findSuggestionNo[_subject]];
        require(singleSuggestion.status == true, "current suggestion closed");
        require(getBalanceVotePower(msg.sender)>=_amount,"caller is not enough to token");
        Voter memory singleVoter = Voter(_subject,msg.sender,0,true,_answer);
        singleVoter.asset = _amount;
       votePower[msg.sender] = SafeMath.sub(getBalanceVotePower(msg.sender), _amount); 
        singleSuggestion.unionMember.push(singleVoter);
    }

     function SuggestionVoter(string memory _subject) external view returns(Voter[] memory){
     Suggestion memory result = suggestions[findSuggestionNo[_subject]];
     Voter[] memory voter = result.unionMember;
     return voter;
    }

    function getBalanceVotePower(address _user) public view returns(uint bal){
        if(votePower[_user] == 0){
           return bal = token.balanceOf(_user);
        }else {
          return bal = votePower[_user];
        }
    } 

    function totalSuggestionNum () external view returns(uint num){
      num = suggestions.length;
    }

    function totalSubjects()external view returns(string[] memory){
      return subjects;
    }

   
}

