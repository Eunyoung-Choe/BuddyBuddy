package buddy.cotroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import data.service.BuddyMemberService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class BuddyMemberController {

	@Autowired
	BuddyMemberService memberService;
	
	@GetMapping("path")
	public String getMethodName(@RequestParam String param) {
		return new String();
	}
	
}
