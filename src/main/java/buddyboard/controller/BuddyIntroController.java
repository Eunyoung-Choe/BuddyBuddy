package buddyboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BuddyIntroController {
	// 로그인 인트로 페이지
	@GetMapping("/login")
	public String showLoginPage() {
		return "intro/login";
	}
}
