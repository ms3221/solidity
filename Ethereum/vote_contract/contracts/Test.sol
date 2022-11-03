// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;




import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Union is ERC721URIStorage {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    mapping(address => bool)public isOwner;
    address[] public owners;

    /*
 Union 컨트랙트에서는 Union이 여러가지 투표안건을 만들 수 있고 투표할 수 있는 컨트랙트입니다. 

------  변수명 설명 ------
Proposals -> Union Member들이 투표할 수 있는 여러제안들입니다. 
suggestion -> 하나의 제안이며 투표할 수 있습니다. 
Voter -> suggestion에 투표하는 union Member 각 한명의 구조체입니다. 
*/

    uint256 public suggestionNo;

    mapping(string => uint256) public findSuggestionNo;
    mapping(string => uint) public userClaim;
    mapping(uint => uint) public votePower;
    // suggestionNo => tokenId => bool
    mapping(uint => mapping(uint => bool)) public isVote;
    

    Suggestion[] public suggestions;
    string[] public subjects;
     
    struct Suggestion {
        string subject; // ""
        uint256 suggestionNo; // 0
        Voter[] unionMember; // []
        uint256 totalAmount; // 0
        uint256 startAt;
        uint256 expireAt;
    }

    struct Voter {
        string suggestion;
        address addr;
        uint256 power;
        uint tokenId;
        string answer;
    }

    constructor(string memory _unionName,address[] memory _owners)
        ERC721(_unionName, _unionName)
    {
          require(_owners.length > 0, "owners required");
      for(uint i; i<_owners.length; i++){
          address owner = _owners[i];
          require(owner != address(0),"invalid owner");
          require(!isOwner[owner], "owner is not unique");
          isOwner[owner] = true;
          owners.push(owner);
      }
    }

    /*
 1. 중복투표 확인
 2. 관리자는 투표 할 수 없도록 확인 
 */
    modifier valid(string memory _subject, uint tokenId) {
             require(!isVote[findSuggestionNo[_subject]][tokenId],"voted");
             require(ownerOf(tokenId)==msg.sender,"invaild Token");
           _;
    }

   modifier onlyOwner(){
       require(isOwner[msg.sender],"not owner");
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
        suggestion.startAt = block.timestamp;
        suggestion.expireAt = block.timestamp + 3 days;
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
        uint tokenId
    ) 
    public
    valid(_subject,tokenId)  
    {
        Suggestion storage singleSuggestion = suggestions[
            findSuggestionNo[_subject]
        ];
     require(block.timestamp < singleSuggestion.expireAt,"auction expired");
      
        Voter memory singleVoter = Voter(
            _subject,
            msg.sender,
            0,
            tokenId,
            _answer
        );
        singleSuggestion.totalAmount +=  votePower[tokenId];
        singleVoter.power = votePower[tokenId];
        singleSuggestion.unionMember.push(singleVoter);
        isVote[findSuggestionNo[_subject]][tokenId] = true;
    }

    /*
  하나의 안건을 종료
  @param _subject 종료시키려 하는 제안의 이름 
    */
    function closeSuggestion(string memory _subject) external onlyOwner {
        Suggestion storage singleSuggestion = suggestions[
            findSuggestionNo[_subject]
        ];
       singleSuggestion.expireAt = block.timestamp;
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



 function mintNFT(address user, string memory ipfsKey,string memory tokenURI,uint power) external onlyOwner returns (uint256) {
        require(userClaim[ipfsKey] == 999, "no right");
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _mint(user, newItemId);
        _setTokenURI(newItemId, tokenURI);
        userClaim[ipfsKey] = newItemId;
        votePower[newItemId] = power;
        return newItemId;
    }
    

      /*
       미리 userList와 ipfsList를 mapping 시키는 함수  엔젤리그 계정만 가능 
       @param userList address배열로 해당되는 조합의 user주소가 담긴 배열
       @param ipfsList string배열로 해당되는 조합의 ipfs hash값이 담긴 배열
       @dev userClaim mapping에 key:ipfsHash value:account 저장
       @ ** 중복된 문자열이 들어오는 것을 미리 앞에서 check하고 점검해줘야 합니다.
     */

    function setUserList(string[] memory ipfsList)
        external
        onlyOwner
    {
        require(ipfsList.length != 0, " zero array");
        for (uint256 i = 0; i < ipfsList.length; i++) {
            userClaim[ipfsList[i]] = 999;
        }
    }

}




contract UnionFactory {
    Union[] public unions;
 
    string[] public unionNames;
    mapping(string => address) findUnionAddress;
    mapping(address => bool)public isOwner;

    address[] public owners;

    constructor(address[] memory _owners) {
        require(_owners.length > 0, "owners required");
      for(uint i; i<_owners.length; i++){
          address owner = _owners[i];
          require(owner != address(0),"invalid owner");
          require(!isOwner[owner], "owner is not unique");
          isOwner[owner] = true;
          owners.push(owner);
      }
    }

    modifier onlyOwner(){
       require(isOwner[msg.sender],"not owner");
       _;
   }

    function createUnion(string memory unionName) external onlyOwner {
        
        Union singleUnion = new Union(unionName, owners);
     
        findUnionAddress[unionName] = address(singleUnion);
        unionNames.push(unionName);
        unions.push(singleUnion);
    }

    /*
      unionName을입력하면 해당하는 contractAddress를 알 수 있는 함수. 
    */
    function getCAddress(string memory unionName)
        external
        view
        onlyOwner
        returns (address unionAddress)
    {
        unionAddress = findUnionAddress[unionName];
    }
    function getTotalUnionName() external view returns(string[] memory result){
        result = unionNames;
    }
}

