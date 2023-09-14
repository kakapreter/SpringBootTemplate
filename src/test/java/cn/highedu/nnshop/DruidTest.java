package cn.highedu.nnshop;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * @Author kakapreter
 * @Data 2023.09.07 14:16
 **/
@SpringBootTest
public class DruidTest {
    @Autowired
    DataSource dataSource;
    @Test
    public void druidTest() throws SQLException {
        //查看默认数据源
        System.out.println(dataSource.getClass());
        //获得数据库连接
        Connection connection = dataSource.getConnection();
        System.out.println(connection);
        //close
        connection.close();
    }
}