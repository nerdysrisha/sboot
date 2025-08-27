package com.bring.lab;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;

@RestController
public class Lab000 {


    //curl http://localhost:8080
    @RequestMapping("/")
    public String greetTheWorld(){

        System.out.println("Sending greetings from package: ");
        String projectName = new File(System.getProperty("user.dir")).getName();

        return "Hello World from project: "+projectName;
    }
}
