package buddymember.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import data.dto.BuddyMemberDto;
import data.service.BuddyMemberService;
import jakarta.servlet.http.HttpSession;

@Controller
public class BuddyProfileController {
    @Autowired
    BuddyMemberService buddyMemberService;

    @GetMapping("/profile")
    public String goProfile(HttpSession session, Model model) {
        // 세션에서 로그인한 사용자 ID 가져오기
        String uid = (String) session.getAttribute("loginid");
        if (uid == null) {
            return "redirect:/login"; // 로그인 안 했으면 로그인 페이지로 이동
        }

        // 사용자 정보 가져오기
        BuddyMemberDto dto = buddyMemberService.getSelectByUid(uid);
        
        // 모델에 사용자 정보 추가
        model.addAttribute("dto", dto); // ${dto.~}
        model.addAttribute("naverurl", "https://kr.object.ncloudstorage.com/bitcamp-bucket-149");

        return "profile/profile"; // profile.jsp로 이동
    }
}
