package com.bring.lab;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;

@RestController
public class Lab000 {

    private final AppConfiguration config;

    public Lab000(AppConfiguration config) {
        this.config = config;
    }

    @RequestMapping("/")
    public String greetTheWorld() {
        System.out.println("Sending greetings. DB Hostname and Port from application.properties / environment / config map "+config.getDbHostname()+":"+  config.getDbPort());

        return String.format("Hello World. DB Host and Port are %s:%s",

                config.getDbHostname(),
                config.getDbPort());
    }
}
