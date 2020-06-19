package com.example.demo.dockerspringboot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class DockerSpringbootApplication {

	public static void main(String[] args) {
		SpringApplication.run(DockerSpringbootApplication.class, args);
		System.out.println("Hello Docker!");
	}

}
