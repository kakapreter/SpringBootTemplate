package cn.highedu.nnshop;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.env.Environment;
@SpringBootApplication
@MapperScan("cn.highedu.nnshop.mapper")
public class NnshopApplication {

    public static void main(String[] args) {
        ConfigurableApplicationContext context = SpringApplication.run(NnshopApplication.class, args);
        Environment environment = context.getBean(Environment.class);

        System.out.println("前台访问链接为：http://localhost:8080");
        System.out.println("后台测试环境为: " + environment.getProperty( "spring.profiles.active") + " 占用端口为: "+environment.getProperty("local.server.port"));
        System.out.println("后台访问链接为: http://localhost:"+environment.getProperty("local.server.port"));
        System.out.println("Swagger2接口测试网址为:http://localhost:"+environment.getProperty("local.server.port")+"/swagger-ui/index.html#/");

    }

}
