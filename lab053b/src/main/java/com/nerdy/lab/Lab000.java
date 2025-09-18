package com.nerdy.lab;

import org.springframework.web.bind.annotation.*;
import java.util.UUID;
import java.util.concurrent.ThreadLocalRandom;
import java.math.BigDecimal;
import java.math.RoundingMode;

@RestController
@RequestMapping("/payment")
public class Lab000 {

    // DTO for request
    public static class PaymentRequest {
        public String accountNumber;
        public String creditCardNumber;
        public String expiryDate;
        public String cvv;
        public Double amount;
        public String destinationAccount;
        public String senderName;
        public String receiverName;
    }

    // DTO for response - includes balanceAmount (EUR)
    public static class PaymentResponse {
        public String status;
        public String referenceNumber;
        public String message;
        public Double processedAmount;
        public Double balanceAmount; // value in EUR

        public PaymentResponse(String status, String referenceNumber, String message, Double processedAmount, Double balanceAmount) {
            this.status = status;
            this.referenceNumber = referenceNumber;
            this.message = message;
            this.processedAmount = processedAmount;
            this.balanceAmount = balanceAmount;
        }
    }

    @PostMapping("/process")
    public PaymentResponse processPayment(
            @RequestHeader("Authorization") String jwtToken,
            @RequestHeader("X-Message-Id") String messageId,
            @RequestBody PaymentRequest request
    ) {
        // (Optional) print headers & request if you want (you asked previously to print everything)
        System.out.println("JWT Token: " + jwtToken);
        System.out.println("Message ID: " + messageId);
        System.out.println("Sender: " + request.senderName + " | Account: " + request.accountNumber);
        System.out.println("Receiver: " + request.receiverName + " | Destination: " + request.destinationAccount);
        System.out.println("Credit Card: " + request.creditCardNumber + " | Expiry: " + request.expiryDate + " | CVV: " + request.cvv);
        System.out.println("Amount: " + request.amount);

        // Dummy processing + generate reference
        String reference = UUID.randomUUID().toString();

        // generate random balance in euros, rounded to 2 decimals (0.00 - 9999.99 EUR)
        Double balanceEur = generateRandomEuroBalance(0.0, 10000.0);

        return new PaymentResponse(
                "SUCCESS",
                reference,
                "Payment processed successfully for " + request.senderName + " to " + request.receiverName,
                request.amount,
                balanceEur
        );
    }

    private static Double generateRandomEuroBalance(double min, double max) {
        double raw = ThreadLocalRandom.current().nextDouble(min, max);
        BigDecimal bd = BigDecimal.valueOf(raw).setScale(2, RoundingMode.HALF_UP);
        return bd.doubleValue();
    }
}
