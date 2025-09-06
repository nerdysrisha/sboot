package com.bring.lab;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.io.File;

@RestController
public class Lab000 {



    @Value("${job.service.url}")
    private String jobServiceUrl;


    private final RestTemplate restTemplate = new RestTemplate();



    //LAB060
    @RequestMapping("/customer/details")
    public String getCustomerDetails() {
        System.out.println("Sending Customer Details: Sridhara Shastry");
        System.out.println("Fetching JobServiceDetails:"+jobServiceUrl+"/job/details");
        String jobDetails = restTemplate.getForObject(jobServiceUrl + "/job/details", String.class);
        return "Customer Details: Sridhara Shastry, " + jobDetails;
    }




}
