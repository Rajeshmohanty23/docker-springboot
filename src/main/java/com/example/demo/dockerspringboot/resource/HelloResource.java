package com.example.demo.dockerspringboot.resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/rest/docker/home")
public class HelloResource {

    @GetMapping
    public String Hello(){
        return "Hello Alberto!";
    }

}
