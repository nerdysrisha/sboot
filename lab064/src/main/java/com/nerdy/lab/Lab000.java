package com.nerdy.lab;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class Lab000 {


    @RequestMapping("/")
    public String greetTheWorld() {
        System.out.println("Sending greetings.");
        return "Readiness and Liveness Probes tesing";

    }
}
