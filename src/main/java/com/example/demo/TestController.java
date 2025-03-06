package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
<<<<<<< HEAD
	@GetMapping("/test")
	public String home()
	{
		return "test";
=======
	@GetMapping("/")
	public String home()
	{
		return "lobby/lobby";
>>>>>>> branch 'main' of https://github.com/Eunyoung-Choe/BuddyBuddy.git
	}
}