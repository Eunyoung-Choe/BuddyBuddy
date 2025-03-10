package data.service;

import java.util.List;

import org.springframework.stereotype.Service;

import data.dto.BuddyMemberDto;
import data.mapper.BuddyMemberMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BuddyMemberService {
	BuddyMemberMapper buddyMemberMapper;
	
	// 모든 유저 정보 가져오기
	public List<BuddyMemberDto> getAllMembers() {
		return buddyMemberMapper.getAllMembers();
	}
	
	// 특정 사용자(id)가 존재하는지 확인
	public boolean isUidCheck(String uid)
	{
		return buddyMemberMapper.checkUid(uid)==1?true:false; // 존재하면 1 반환
	}

	// 특정 유저 정보를 가져오기
	public BuddyMemberDto getBuddyMemberInfo(String uid) {
		return buddyMemberMapper.getBuddyMemberByUid(uid);  
	}

	// 로그인
	public boolean loginCheck(String loginid, String loginpass) {
		return buddyMemberMapper.loginCheck(loginid, loginpass)==1?true:false;
	}
	public BuddyMemberDto getSelectByUid(String uid) {
		return buddyMemberMapper.getSelectByUid(uid);
	}
	
	
	public void insertBuddyBoard(BuddyMemberDto dto)
	{
		String uname = dto.getUname();
		String uid = dto.getUid();
		String upass = dto.getUpass();
		String uprofile = dto.getUprofile();
		
		dto.setUname(uname);
		dto.setUid(uid);
		dto.setUpass(upass);
		dto.setUprofile(uprofile);
		
		buddyMemberMapper.insertBuddyBoard(dto); // DB insert 
	}
	
	// 유저 정보 수정
	public void updateBuddyMember(BuddyMemberDto dto) {
        buddyMemberMapper.updateBuddyMember(dto);
    }

}
