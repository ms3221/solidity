/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import "../node_modules/@openzeppelin/contracts/access/Ownable.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "../node_modules/@openzeppelin/contracts/utils/Counters.sol";
import "../node_modules/@openzeppelin/contracts/utils/Counters.sol";

contract Union is ERC721URIStorage {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    /*
 Union 컨트랙트에서는 Union이 여러가지 투표안건을 만들 수 있고 투표할 수 있는 컨트랙트입니다. 

------  변수명 설명 ------
Proposals -> Union Member들이 투표할 수 있는 여러제안들입니다. 
suggestion -> 하나의 제안이며 투표할 수 있습니다. 
Voter -> suggestion에 투표하는 union Member 각 한명의 구조체입니다. 
*/

    uint256 public suggestionNo;
    address public owner;

    mapping(string => uint256) public findSuggestionNo;
    mapping(string => address) public userClaim;
    mapping(uint => mapping(address => bool)) isVote;

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
        uint256 power;
        bool voted;
        string answer;
    }

    constructor(string memory _unionName,address _owner)
        ERC721(_unionName, _unionName)
    {
        owner = _owner;
    }

    /*
 1. 중복투표 확인
 2. 관리자는 투표 할 수 없도록 확인 
 */
    modifier valid(string memory _subject, address voter) {
             require(!isVote[findSuggestionNo[_subject]][voter],"voted");
           _;
    }

    modifier onlyOwner(){
          require(owner == msg.sender,"caller is not owner");
           _;
    }

    /*
  안건을 발행 및 저장 
  @param _subject는 새로운 안건이름 
  @dev struct구조체 suggestion에 새로운 안건이름을 저장 
*/
    function createOneSuggestion(string memory _subject)
        external
        onlyOwner
    {
        
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
    ) 
    public
    valid(_subject,msg.sender)  
    {
        Suggestion storage singleSuggestion = suggestions[
            findSuggestionNo[_subject]
        ];
        require(singleSuggestion.status, "closed");
      
        Voter memory singleVoter = Voter(
            _subject,
            msg.sender,
            0,
            true,
            _answer
        );
        singleVoter.power = _amount;
        singleSuggestion.unionMember.push(singleVoter);
        isVote[ findSuggestionNo[_subject]][msg.sender] = true;
    }

    /*
  하나의 안건을 종료
  @param _subject 종료시키려 하는 제안의 이름 
    */
    function closeSuggestion(string memory _subject) external onlyOwner {
        Suggestion storage singleSuggestion = suggestions[
            findSuggestionNo[_subject]
        ];
        singleSuggestion.status = false;
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
        onlyOwner
        returns (Suggestion memory)
    {
        Suggestion memory Info = suggestions[_num];
        require(Info.suggestionNo == _num, "failed get suggestionInfo");
        return Info;
    }

    function getSubjects()external view returns(string[] memory result){
        result = subjects;
    }



 function mintNFT(string memory tokenURI) external returns (uint256) {
        require(userClaim[tokenURI] == msg.sender, "no right");
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        return newItemId;
    }
    

      /*
       미리 userList와 ipfsList를 mapping 시키는 함수  엔젤리그 계정만 가능 
       @param userList address배열로 해당되는 조합의 user주소가 담긴 배열
       @param ipfsList string배열로 해당되는 조합의 ipfs hash값이 담긴 배열
       @dev userClaim mapping에 key:ipfsHash value:account 저장
     */

    function setUserList(address[] memory userList, string[] memory ipfsList)
        external
        onlyOwner
    {
        require(userList.length != 0 && ipfsList.length != 0, " zero array");
        require(userList.length == ipfsList.length, "not same length");
        for (uint256 i = 0; i < userList.length; i++) {
            userClaim[ipfsList[i]] = userList[i];
        }
    }

}

