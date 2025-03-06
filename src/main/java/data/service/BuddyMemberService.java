package data.service;

import org.springframework.stereotype.Service;

import data.dto.BuddyMemberDto;

@Service
public class BuddyMemberService {

	BuddyMemberService memberService;
	public BuddyMemberDto getSelectByUid(String uid) {
		return memberService.getSelectByUid(uid);
	}
}
