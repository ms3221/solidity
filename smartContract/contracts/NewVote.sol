

   
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
        uint[] unionMember;
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

 Voter public voter;

/*
  @param 
  subject -> 어떤 주제로 안건을 만들것인지
*/
function createOneSuggestion(string memory _subject)external returns (Suggestion memory) {
     Suggestion memory suggestion;
     suggestion.subject = _subject;
     suggestion.suggestionNo = suggestionNo;
     suggestion.status = true;
     findSuggestionNo[_subject] = suggestionNo;
     suggestions.push(suggestion);
     suggestionNo++;
     return suggestion;
}


     //중복투표 및 제안서를 낸 사람을 미리 check해주는 modifier
    //  modifier validVoter(string memory _subject,address voter){
    //     Suggestion storage singleSuggestion = suggestions[findSuggestionNo[_subject]];
    //      for(uint i=0; i<singleSuggestion.unionMember.length; i++){
    //          if(singleSuggestion.unionMember[i].addr == voter){
    //            require(singleSuggestion.unionMember[i].voted == false, "voter already voted"); 
    //          }
    //      }
    //     require(voter != chairperson, "chairperson is not alrigth");
    //     _;
    // }

   /// 3.투표하는 함수
     function vote (string memory _subject, string memory _answer) public payable returns(Suggestion memory) {
       Suggestion storage singleSuggestion = suggestions[findSuggestionNo[_subject]];
      //  require(singleSuggestion.status == true, "current suggestion closed");
      //   Voter memory singleVoter;
      //   singleVoter.suggestion=_subject;
      //   singleVoter.addr = msg.sender;
      //   singleVoter.asset = msg.value;
      //   singleVoter.voted = false;
      //   singleVoter.answer = _answer;
     
      //  singleSuggestion.unionMember.push(singleVoter);
      //  //address(this).call{value:msg.value};
      //  suggestions[findSuggestionNo[_subject]] =singleSuggestion;
       return singleSuggestion;
    }

}




contract UnionFactory {

     Union[] public unions; 
     mapping(string => address) findUnionAddress;

   /*
      각각 해당하는 union contract를 생성하는 함수 
      UnionFactory의 기능은 각 조합에 해당하는 컨트랙트를 만들어 주는 가장 큰 상위의 컨트랙트입니다.
      
      ----- 변수명 설명 ------ 
      unions -> 각각의 union Contract를 담을 수 있는 union 컨트랙트로 이루어진 배열객체
      findUnionAddress -> 조합이름을 가지고 컨트랙트 주소를 찾기 위한 mapping 

    */


   /*
     @param 
     unionName : 만들려고하는 조합의 이름 
   */
    function createUnion(string memory unionName,address chairperson)external {
        Union singleUnion = new Union(unionName,chairperson);
        findUnionAddress[unionName] = address(singleUnion);
        unions.push(singleUnion);
    } 

    /*
     지금까지 몇개의 조합이 만들어져있는지 읽기위한 함수 
   */
    function totalUnionNumber()external view returns(uint num){
       num = unions.length;
    }  
    /*
      unionName을입력하면 해당하는 contractAddress를 알 수 있는 함수. 
    */
    function UnionAddress(string memory unionName) external view returns(address unionAddress){
        unionAddress = findUnionAddress[unionName];
    }
    
}