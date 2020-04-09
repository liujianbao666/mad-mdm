package com.jekeen.mdm;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;


@SpringBootApplication(scanBasePackages = {"com.jekeen.users.**", "com.jekeen.mdm.**"})
@EnableTransactionManagement
@MapperScan({"com.jekeen.**.dao.**","com.jekeen.mdm.dao.**"})
public class WebApplication {

    public static void main(String[] args) {
        SpringApplication.run(WebApplication.class, args);
    }
}
