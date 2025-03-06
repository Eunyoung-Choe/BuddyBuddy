
package data.mapper;

import org.apache.ibatis.annotations.Mapper;

import data.dto.BuddyMemberDto;


@Mapper
public interface BuddyMemberMapper {
	public int checkUid(String uid);
	
	// 유저 정보 조회
	public BuddyMemberDto getBuddyMemberByUid(String uid);
	public BuddyMemberDto getBuddyMemberInfo(String uid);
	
	// 로그인
	public int loginCheck(String loginid, String loginpass);
	public BuddyMemberDto getSelectByUid(String uid);
}
