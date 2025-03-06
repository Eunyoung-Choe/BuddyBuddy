package data.service;

import org.springframework.stereotype.Service;

import data.dto.BuddyMemberDto;
import data.mapper.BuddyMemberMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BuddyMemberService {
	BuddyMemberMapper buddyMemberMapper;
	
	public boolean isUidCheck(String uid)
	{
		return buddyMemberMapper.checkUid(uid)==1?true:false;
	}

	// 회원 정보를 가져오기
	public BuddyMemberDto getBuddyMemberInfo(String uid) {
		String userId = "user2";  // 실제 로그인된 유저의 아이디를 사용해야 함. 
		return buddyMemberMapper.getBuddyMemberByUid(userId);  
	}

	// 로그인
	public boolean loginCheck(String loginid, String loginpass) {
		return buddyMemberMapper.loginCheck(loginid, loginpass)==1?true:false;
	}
	public BuddyMemberDto getSelectByUid(String uid) {
		return buddyMemberMapper.getSelectByUid(uid);
	}

}
