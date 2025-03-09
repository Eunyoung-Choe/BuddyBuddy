package com.example.demo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"data.*", "*.controller", "naver.storage", "com.example.demo", "*.mapper"})
@MapperScan({"data.mapper"})
public class SpringBuddyMvcApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBuddyMvcApplication.class, args);
	}

}
