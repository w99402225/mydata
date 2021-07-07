package cn.edu.zust.se;

import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@EnableDubbo
@SpringBootApplication
public class DubbohellorestApplication {

	public static void main(String[] args) {
		SpringApplication.run(DubbohellorestApplication.class, args);
	}

}
