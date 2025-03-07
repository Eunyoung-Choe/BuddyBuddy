package buddymember.controller;

import data.dto.BuddyMemberDto;
import data.dto.BuddyBoardLobbyDto;
import data.service.BuddyMemberService;
import data.service.BuddyBoardLobbyService;
import jakarta.servlet.http.HttpSession;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BuddyMemberController {
    @Autowired 
    BuddyMemberService buddyMemberService; 
    
    @Autowired
    BuddyBoardLobbyService buddyBoardLobbyService; // 추가

    @GetMapping("/lobby")
    public String buddyMemberDetail(HttpSession session, Model model) {
        String loginId = (String) session.getAttribute("loginid");
        if (loginId == null) {
            return "redirect:/login";
        }

        // 사용자 정보 가져오기
        BuddyMemberDto member = buddyMemberService.getBuddyMemberInfo(loginId);
        model.addAttribute("dto", member);

        // 게시글 페이징 리스트 추가
        int start = 0; // 기본값 (페이지네이션 구현 필요)
        int perpage = 10; // 한 페이지당 게시글 개수
        List<BuddyBoardLobbyDto> boardList = buddyBoardLobbyService.getPagingList(start, perpage);
        model.addAttribute("boardList", boardList);

        return "lobby/lobby";
    }


	
	
	// 아래 코드는 List로 <c:forEach>로 데이터를 반복 출력하는 형태
	/*public String buddyMemberList(Model model)
	{
		// BuddyMemberService.java의 getAllMembers()
		List<BuddyMemberDto> members = buddyMemberService.getAllMembers();
		model.addAttribute("members", members); // 모든 회원 데이터 조회 -> 조회된 회원 목록을 members라는 이름으로 jsp에 전달! (실습 파일에서의 list가 여기에 해당)
		
	    model.addAttribute("naverurl", "https://kr.object.ncloudstorage.com/bitcamp-bucket-149");
	    model.addAttribute("fronturl", "https://2vfpxf298730.edge.naverncp.com/Dtk3zSOoO7");
	    model.addAttribute("backurl", "?type=f&w=30&h=30&faceopt=true&ttype=jpg");
	    
	    return "lobby/lobby"; //lobby.jsp로 전달
	    
	}*/
}
