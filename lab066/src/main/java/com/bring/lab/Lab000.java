package com.bring.lab;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class Lab000 {


    @RequestMapping("/")
    public String greetTheWorld() {

        String data="HPA Enabled simple yaml. Metrics driven by CPU Server";
        System.out.println(data);
        return data;

    }
}
