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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class BuddyMemberController {
	private String bucketName = "bitcamp-bucket-149";
	
    @Autowired 
    BuddyMemberService buddyMemberService; 
    
    @Autowired
    BuddyBoardLobbyService buddyBoardLobbyService;

    @GetMapping("/lobby")
    public String buddyMemberDetail(
    		@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, 
            HttpSession session,
            Model model) 
    {
        String loginId = (String) session.getAttribute("loginid");
        if (loginId == null) {
            return "redirect:/login";
        }
        
        
        // 여기부터
        
//        String uprofile = buddyMemberService.getSelectByUid(dto.getUid()).
        
        // 사용자 정보 가져오기
        BuddyMemberDto member = buddyMemberService.getBuddyMemberInfo(loginId);
        
        model.addAttribute("dto", member);
        model.addAttribute("naverurl", "https://kr.object.ncloudstorage.com/"+bucketName);
        
        
        

        // 페이징 처리 =================================================================
        int perPage = 5;  // 한 페이지당 출력할 글 개수
        int perBlock = 5;  // 한 블럭당 출력할 페이지 개수
        int totalCount = buddyBoardLobbyService.getTotalCount(); // 전체 게시글 개수
        int totalPage = (int) Math.ceil((double) totalCount / perPage); // 총 페이지 수

        int startPage = (pageNum - 1) / perBlock * perBlock + 1; // 블럭의 시작 페이지
        int endPage = startPage + perBlock - 1; // 블럭의 끝 페이지
        if (endPage > totalPage) endPage = totalPage; // 마지막 페이지 초과 방지

        int startNum = (pageNum - 1) * perPage; // MySQL 기준으로 가져올 시작 번호
        int no = totalCount - (pageNum - 1) * perPage; // 화면에 출력할 게시글 번호

        // 페이징된 게시글 가져오기
        List<BuddyBoardLobbyDto> boardList = buddyBoardLobbyService.getPagingList(startNum, perPage);
        
        // 마지막 페이지에서 데이터가 없으면 이전 페이지로 리디렉트
        if (boardList.isEmpty() && pageNum > 1) {
            return "redirect:/lobby?pageNum=" + (pageNum - 1);
        }

        // 모델에 값 저장
        model.addAttribute("boardList", boardList);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("no", no);
        model.addAttribute("pageNum", pageNum);

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
    
    
	 	// 한마디 저장
	    @PostMapping("/lobby")
	    public String saveSentence(@ModelAttribute BuddyBoardLobbyDto dto, HttpSession session) {
	        // 로그인된 사용자 ID 가져오기
	        String loginId = (String) session.getAttribute("loginid");
	        if (loginId == null) {
	            return "redirect:/login";  // 로그인하지 않았다면 로그인 페이지로 이동
	        }
	
	        // 사용자 ID 설정
	        dto.setWriter(loginId);
	        
	        // DB에 저장
	        buddyBoardLobbyService.insertSentence(dto);
	
	        // 저장 후 로비 페이지로 리다이렉트
	        return "redirect:/lobby";
    }
	    

}
