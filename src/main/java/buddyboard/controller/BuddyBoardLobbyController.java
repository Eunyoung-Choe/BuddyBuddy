package buddyboard.controller;

import org.springframework.stereotype.Controller;

import data.service.BuddyBoardLobbyService;
import data.service.BuddyMemberService;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class BuddyBoardLobbyController {
	final BuddyBoardLobbyService fileService; // 게시판 관련 데이터 처리 (글 작성, 삭제 등)
	final BuddyMemberService buddyMemberService; // 사용자 정보 관리 (작성자 이름, 프로필 사진 등 조회)
	
	
	
	
}
