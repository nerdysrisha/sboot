package com.bring.lab;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;

@RestController
public class Lab000 {


    @RequestMapping("/job/details")
    public String getJobDetails() {
        System.out.println("Sending Job Details: Architect");
        return "Job Details: Architect";
    }


}
