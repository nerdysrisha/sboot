package com.bring.lab;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;

@RestController
public class Lab000 {

    @RequestMapping("/ing1")
    public String greetTheWorld() {
        System.out.println("Sending greetings from Ingress 1: ");
        return "Hello World from Ingress one. Path /ing1";
    }
}
