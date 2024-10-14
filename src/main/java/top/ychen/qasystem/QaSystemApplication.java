package top.ychen.qasystem;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("top.ychen.qasystem.mapper")
public class QaSystemApplication {

    public static void main(String[] args) {
        SpringApplication.run(QaSystemApplication.class, args);
    }

}
