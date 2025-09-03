package com.bring.lab;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.ResponseEntity;

@RestController
public class Lab000 {

    @RequestMapping("/egress/intg1")
    public String greetTheWorld() {
        System.out.println("Sending greetings from Egress : ");

        // Invoke third-party API
        String apiResponse = invokeThirdPartyAPI();

        return "Hello World from Egress. Path /egress/intg1\nThird Party API Response: " + apiResponse;
    }

    private String invokeThirdPartyAPI() {
        try {
            RestTemplate restTemplate = new RestTemplate();
            // Using JSONPlaceholder - a free fake API for testing
            String apiUrl = "https://jsonplaceholder.typicode.com/posts/1";

            System.out.println("Calling third-party API: " + apiUrl);

            ResponseEntity<String> response = restTemplate.getForEntity(apiUrl, String.class);

            System.out.println("API Response Status: " + response.getStatusCode());
            System.out.println("API Response Body: " + response.getBody());

            return response.getBody();

        } catch (Exception e) {
            System.err.println("Error calling third-party API: " + e.getMessage());
            e.printStackTrace();
            return "Error: " + e.getMessage();
        }
    }
}