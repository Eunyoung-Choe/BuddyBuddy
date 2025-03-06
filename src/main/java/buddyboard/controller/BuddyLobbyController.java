package buddyboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BuddyLobbyController {
	// 미니홈피 로비 입장
	@GetMapping("/lobby")
	public String showLobbyPage() {
		return "lobby/lobby";
	}
}
