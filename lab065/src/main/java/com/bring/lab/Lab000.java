package com.bring.lab;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class Lab000 {


    @RequestMapping("/")
    public String greetTheWorld() {

        String data="Heavy analytics work load is running. This app will run on tainted node that is dedicated for Analytics. Refer Deployment.yaml";
        System.out.println(data);
        return data;

    }
}
