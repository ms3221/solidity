

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Union{



address public chairperson;
string public unionName;
uint public suggestionNo;
mapping (string => uint) findSuggestionNo;
Suggestion[] public suggestions; 
//거버넌스에 투표하는 voter 구조체 
   struct Voter {
        string suggestion;
        address addr;
        uint256 asset;
        bool voted;
        string answer;
    }


 struct Suggestion {
        string subject;
        uint suggestionNo;
        bool status;
        Voter[] voters;
    }



 // 각종 이벤트들 


//* 컨트랙트를 생성과 동시에 제안이 만들어져있다. 
//* 만들어질때 unionId, chairPersion, open 값들이 담겨진다. 
 
   constructor(string memory _unionName,address owner){
       chairperson = owner;
       unionName = _unionName;
    }

function createOneSuggestion(string memory _subject)external {
     Suggestion storage suggestion = suggestions.push();
     suggestion.subject = _subject;
     suggestion.suggestionNo = suggestionNo;
     suggestion.status = true;
     suggestions.push(suggestion);
     findSuggestionNo[_subject] = suggestionNo;
     suggestionNo++;
}





     //중복투표 및 제안서를 낸 사람을 미리 check해주는 modifier
    //  modifier valid(address voter){
        
    //      for(uint i=0; i<proposal.Voters.length; i++){
    //          if(proposal.Voters[i].addr == voter){
    //            require(proposal.Voters[i].voted == false, "voter already voted"); 
    //          }
    //      }
    //     require(msg.sender !=  proposal.chairperson,"chairperson is not alrigth");
    //     _;
    // }

    // 3.투표하는 함수
    //  function vote (string memory answer) public payable valid(msg.sender) {
    //  require(proposal.open == true, "current proposal closed");
    //  require(msg.value >= 1e18,"more than send the token");

    //   Voter memory voter = Voter({
    //       addr:msg.sender,
    //       asset:msg.value,
    //       voted:true,
    //       answer:answer,
    //       unionId : proposal.UnionId
    //       });
    //   address(this).call{value:msg.value};
    //   proposal.Voters.push(voter);
    //   emit voteReceipt(msg.sender, answer);
    // }

    //투표내역이 전부 나오게 된다. 
    // function totalVoteOutput() external view returns(Voter[] memory){
    //     Voter[] memory result = proposal.Voters;
    //   return  result;
    // }

    // function totalProposal() external view returns(Proposal memory){
    // //  Proposal memory result = proposal;
    // //   return result.UnionId;
    //  Proposal memory result = proposal;
    //  return result;
    // }

}


    //미리 투표가능한 인원을 조합마다 한정해서 투표 권한을 부여해주는 함수 
    // function registerVoter(address[] memory addrs, uint proposalIndex) external returns(address[] memory){
    //      for(uint i=0; i<addrs.length; i++){
    //       Voter memory voter;
    //       voter.addr = addrs[i];
    //       Proposals[proposalIndex].Voters.push(voter); 
    //    }
    //    return addrs;
    //    }

     //등록된 주소인지 확인하는 함수 
    //  function validAddress(uint proposalIndex) internal view returns(bool result){
    //      uint check = 0;
    //      for(uint i=0; i< Proposals[proposalIndex].Voters.length; i++){
    //      Proposals[proposalIndex].Voters[i].addr == msg.sender;
    //     check++;
    //    }
    //    if(check > 0){
    //        result = true;
    //    }else {
    //        result = false;
    //    }
    //  }


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
    
}