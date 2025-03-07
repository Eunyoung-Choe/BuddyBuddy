package buddymember.controller;

import data.dto.BuddyMemberDto;
import data.mapper.BuddyMemberMapper;
import data.service.BuddyMemberService;
import jakarta.servlet.http.HttpSession;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BuddyMemberController {
	@Autowired 
	BuddyMemberService buddyMemberService; 
	
	@GetMapping("/lobby")
	public String buddyMemberDetail(HttpSession session, Model model) {
		// DTO에 담긴 SQL 데이터 한 개씩 사용할 수 있도록 (dto.uname 등)
	    String loginId = (String) session.getAttribute("loginid"); // 세션에서 로그인한 사용자 ID 가져오기

	    if (loginId == null) {
	        return "redirect:/login"; // 로그인 페이지로 리다이렉트
	    }

	    // 특정 회원 정보 가져오기
	    BuddyMemberDto member = buddyMemberService.getBuddyMemberInfo(loginId);
	    model.addAttribute("dto", member);

	    return "lobby/lobby";
	}
	
	
	
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
