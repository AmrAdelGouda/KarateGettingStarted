package com.example;

import com.intuit.karate.junit5.Karate;

public class KarateTestRunner {

    @Karate.Test
    Karate testSample() {
        ConfigReader configReader = new ConfigReader("config.properties");
        String featureFiles = configReader.getProperty("features");
        String[] features = featureFiles.split(",");
        return Karate.run(features).relativeTo(getClass());
//        return Karate.run("classpath:features/sample.feature","classpath:features/sample2.feature");
    }
}
