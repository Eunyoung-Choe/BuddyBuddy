package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("com.*")
public class SpringBuddyMvcApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBuddyMvcApplication.class, args);
	}

}
