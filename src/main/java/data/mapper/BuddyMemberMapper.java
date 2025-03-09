
package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.BuddyMemberDto;


@Mapper
public interface BuddyMemberMapper {
	public int checkUid(String uid);
	
	// 전체 유저 정보 조회
	public List<BuddyMemberDto> getAllMembers();
	
	// 특정 유저 정보 조회
	public BuddyMemberDto getBuddyMemberByUid(String uid);
	
	// 로그인
	public int loginCheck(String loginid, String loginpass);
	public BuddyMemberDto getSelectByUid(String uid);
	
	public void insertBuddyBoard(BuddyMemberDto dto);
	
	void updateBuddyMember(BuddyMemberDto dto);
}
