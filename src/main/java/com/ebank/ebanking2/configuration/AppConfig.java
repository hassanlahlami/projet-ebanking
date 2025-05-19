package com.ebank.ebanking2.configuration;


import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

//kadir fih configuration dyal bd
@Configuration
@EnableTransactionManagement
@ComponentScan(basePackages = "com.ebank.ebanking2")
@EnableMongoRepositories(basePackages = "com.ebank.ebanking2.repository")
public class AppConfig {

    @Bean
    public MongoClient mongoClient() {
        return MongoClients.create("mongodb://localhost:27017");
    }

    @Bean
    public MongoTemplate mongoTemplate() {
        return new MongoTemplate(mongoClient(), "testdatabase");
    }
}