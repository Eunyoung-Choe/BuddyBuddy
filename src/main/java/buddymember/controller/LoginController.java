package buddymember.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import data.service.BuddyMemberService;
import jakarta.servlet.http.HttpSession;

@RestController
public class LoginController {
	@Autowired
	BuddyMemberService buddyMemberService;
	
	// 로그인 시작 페이지
	@GetMapping("/intro/login")
	public Map<String, String> login(
			@RequestParam String loginid, @RequestParam String loginpass,
			HttpSession session
			)
	{
		Map<String, String> map = new HashMap<>();
		boolean b = buddyMemberService.loginCheck(loginid, loginpass);
		// 아이디와 비번이 맞을 경우 세션 저장
		if(b) {
			session.setMaxInactiveInterval(60*60*4); // 4시간 유지
			session.setAttribute("loginstatus", "success");
			session.setAttribute("loginid", loginid); // title.jsp 참고
			
			// 아이디에 해당하는 프로필 사진 얻기
			String photo = buddyMemberService.getSelectByUid(loginid).getUprofile();
			session.setAttribute("loginphoto", photo);
		}
		map.put("result", b?"success":"fail");
		
		return map;
	}
	
	// 로그아웃 추후 처리
}
