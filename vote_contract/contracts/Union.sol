/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Union{

/*
 Union 컨트랙트에서는 Union이 여러가지 투표안건을 만들 수 있고 투표할 수 있는 컨트랙트입니다. 

------  변수명 설명 ------
Proposals -> Union Member들이 투표할 수 있는 여러제안들입니다. 
suggestion -> 하나의 제안이며 투표할 수 있습니다. 
Voter -> suggestion에 투표하는 union Member 각 한명의 구조체입니다. 
*/


address public chairperson;
string public unionName;
uint public suggestionNo;
mapping (string => uint) findSuggestionNo;
Suggestion[] public suggestions; 



  struct Suggestion {
       
        string subject;
        uint suggestionNo;
        Voter[] unionMember;
        bool status;
        
    }


  struct Voter {
        string suggestion;
        address addr;
        uint256 asset;
        bool voted;
        string answer;
    }


    constructor(string memory _unionName,address owner){
       chairperson = owner;
       unionName = _unionName;
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
     findSuggestionNo[_subject] = suggestionNo;
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
     function vote (string memory _subject, string memory _answer) public payable validVoter(_subject,msg.sender) {
       Suggestion storage singleSuggestion = suggestions[findSuggestionNo[_subject]];
        require(singleSuggestion.status == true, "current suggestion closed");
        Voter memory singleVoter = Voter(_subject,msg.sender,msg.value,true,_answer);
        singleSuggestion.unionMember.push(singleVoter);
        address(this).call{value:msg.value};
    }

     function SuggestionVoter(string memory _subject) external view returns(Voter[] memory){
     Suggestion memory result = suggestions[findSuggestionNo[_subject]];
     Voter[] memory voter = result.unionMember;
     return voter;
    }
}

