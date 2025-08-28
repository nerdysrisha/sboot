package com.bring.lab;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AppConfiguration {

    // These values will come from environment variables or application.properties
    @Value("${dbhostname:hardcodedhostname}")
    private String dbhostname;

    @Value("${dbport:hardcodedport}")
    private String dbport;

    public String getDbHostname() {
        return dbhostname;
    }

    public String getDbPort() {
        return dbport;
    }
}
