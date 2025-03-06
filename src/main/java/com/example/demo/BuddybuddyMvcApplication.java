package com.example.demo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"data.*","*.controller","com.example.demo","*.mapper"})
@MapperScan({"buddy.mapper"})
public class BuddybuddyMvcApplication {

	public static void main(String[] args) {
		SpringApplication.run(BuddybuddyMvcApplication.class, args);
	}

}
