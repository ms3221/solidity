/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "../node_modules/@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Union {
    using SafeMath for uint256;

    /*
 Union 컨트랙트에서는 Union이 여러가지 투표안건을 만들 수 있고 투표할 수 있는 컨트랙트입니다. 

------  변수명 설명 ------
Proposals -> Union Member들이 투표할 수 있는 여러제안들입니다. 
suggestion -> 하나의 제안이며 투표할 수 있습니다. 
Voter -> suggestion에 투표하는 union Member 각 한명의 구조체입니다. 
*/

    string public unionName;
    uint256 public suggestionNo;

    mapping(string => uint256) public findSuggestionNo;
    mapping(address => uint256) public votePower;

    address public owner;
    Suggestion[] public suggestions;
    string[] public subjects;

    struct Suggestion {
        string subject; // ""
        uint256 suggestionNo; // 0
        Voter[] unionMember; // []
        uint256 totalAmount; // 0
        bool status; //false
    }

    struct Voter {
        string suggestion;
        address addr;
        uint256 asset;
        bool voted;
        string answer;
    }

    constructor(string memory _unionName, address _owner) {
        unionName = _unionName;
        owner = _owner;
    }

    /*
 1. 중복투표 확인
 2. 관리자는 투표 할 수 없도록 확인 
 */
    modifier validVoter(string memory _subject, address voter) {
        Suggestion storage singleSuggestion = suggestions[
            findSuggestionNo[_subject]
        ];
        for (uint256 i = 0; i < singleSuggestion.unionMember.length; i++) {
            if (singleSuggestion.unionMember[i].addr == voter) {
                require(
                    singleSuggestion.unionMember[i].voted == false,
                    "already"
                );
            }
        }

        _;
    }

    /*
  안건을 발행 및 저장 
  @param _subject는 새로운 안건이름 
  @dev struct구조체 suggestion에 새로운 안건이름을 저장 
*/
    function createOneSuggestion(string memory _subject) external {
        Suggestion storage suggestion = suggestions.push();
        suggestion.subject = _subject;
        suggestion.suggestionNo = suggestionNo;
        suggestion.status = true;
        findSuggestionNo[_subject] = suggestionNo;
        subjects.push(_subject);
        suggestionNo++;
    }

    /*
  user 투표 
  @param _subject는 새로운 안건이름 
  @param _answer는 투표내용 (ex)찬성, 반대)
  @param _amount 투표 power
  @dev struct구조체 suggestion에 새로운 안건이름을 저장 
*/
    function vote(
        string memory _subject,
        string memory _answer,
        uint256 _amount
    ) public payable validVoter(_subject, msg.sender) {
        Suggestion storage singleSuggestion = suggestions[
            findSuggestionNo[_subject]
        ];
        require(singleSuggestion.status == true, "closed");
        require(getBalanceVotePower(msg.sender) >= _amount, "not enough");
        Voter memory singleVoter = Voter(
            _subject,
            msg.sender,
            0,
            true,
            _answer
        );
        singleVoter.asset = _amount;
        votePower[msg.sender] = SafeMath.sub(
            getBalanceVotePower(msg.sender),
            _amount
        );
        singleSuggestion.unionMember.push(singleVoter);
    }

    /*
  하나의 안건에 대한 정보 요청 
  @param _num suggestions에서 위치를 query 하기위해 필요한 인자
  @dev  suggestions 배열에서 해당하는 struct구조체 suggestion을 가져온다.
  @return struct구조체 suggestion(subject, suggestionNo, unionMember, totalAmount, status)
*/
    function getSuggestionInfo(uint256 _num)
        external
        view
        returns (Suggestion memory)
    {
        require(owner == msg.sender, "user is not owner");
        Suggestion memory Info = suggestions[_num];
        require(Info.suggestionNo == _num, "failed");
        return Info;
    }

    /*
  하나의 안건에서 투표한 모든 투표자들 정보 요청
  @param _num suggestions에서 위치를 query 하기위해 필요한 인자
  @dev  suggestions 배열에서 해당하는 struct구조체 suggestion을 가져온다.
  @return struct구조체 suggestion에서 unionMember

  * getSuggestionInfo함수와 합쳐도 무방하다
*/

    function getSuggestionVoter(uint256 _num)
        external
        view
        returns (Voter[] memory)
    {
        require(owner == msg.sender, "user is not owner");
        Suggestion memory info = suggestions[_num];
        Voter[] memory voter = info.unionMember;
        return voter;
    }

    /*
  ERC20에서 ERC721로 변환 되는 과정이어서 수정이 필요함 
  하나의 안건에서 투표한 모든 투표자들 정보 요청
  @param _user tn
  @dev  suggestions 배열에서 해당하는 struct구조체 suggestion을 가져온다.
  @return struct구조체 suggestion에서 unionMember
  
  * getSuggestionInfo함수와 합쳐도 무방하다
*/
    function setVotePower(address _user, uint256 _amount) external {
        votePower[_user] = _amount;
    }

    function getBalanceVotePower(address _user)
        public
        view
        returns (uint256 bal)
    {
        bal = votePower[_user];
    }
}
