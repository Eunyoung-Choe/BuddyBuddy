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
		boolean b = buddyMemberService.loginCheck(loginid, loginpass); // 로그인 성공 여부를 클라이언트에 JSON 형태로 전달
		// 아이디와 비번이 맞을 경우 세션에 저장
		if(b) {
			session.setMaxInactiveInterval(60*60*4); // 4시간 유지
			session.setAttribute("loginstatus", "success");
			session.setAttribute("loginid", loginid);
		}
		map.put("result", b?"success":"fail");
		
		return map;
	}
	
	// 로그아웃 처리
	@GetMapping("/intro/logout")
	public void memberLogout(HttpSession session)
	{
		session.removeAttribute("loginstatus");
		session.removeAttribute("loginid");
	}
}
