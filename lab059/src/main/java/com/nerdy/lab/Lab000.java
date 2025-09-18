package com.nerdy.lab;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.ResponseEntity;

@RestController
public class Lab000 {

    @RequestMapping("/egress/intg1")
    public String greetTheWorld() {
        System.out.println("Sending greetings from Egress:");

        // Invoke HTTPBin API
        String apiResponse = invokeHttpBinAPI();

        return "Hello World from Egress. Path /egress/intg1\nHTTPBin API Response: " + apiResponse;
    }

    private String invokeHttpBinAPI() {
        try {
            RestTemplate restTemplate = new RestTemplate();
            // Using HTTPBin - a free API for testing HTTP requests
            String apiUrl = "http://httpbin.org/get";

            System.out.println("Calling HTTPBin API: " + apiUrl);

            ResponseEntity<String> response = restTemplate.getForEntity(apiUrl, String.class);

            System.out.println("HTTPBin Response Status: " + response.getStatusCode());
            System.out.println("HTTPBin Response Body: " + response.getBody());

            return response.getBody();

        } catch (Exception e) {
            System.err.println("Error calling HTTPBin API: " + e.getMessage());
            e.printStackTrace();
            return "Error: " + e.getMessage();
        }
    }
}
