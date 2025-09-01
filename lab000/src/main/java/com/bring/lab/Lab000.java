package com.bring.lab;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
public class Lab000 {

    /*
    cd c:\ws\sboot\lab000
    mvn clean package
    curl http://localhost:8081/greetings
     */

    @RequestMapping("/greetings")
    public String greetTheWorld(){

        System.out.println("Sending greetings");

        return "Hello World";
    }
}
