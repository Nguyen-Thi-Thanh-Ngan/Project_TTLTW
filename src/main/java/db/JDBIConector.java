package db;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;

import java.sql.SQLException;

public class JDBIConector {
    private static Jdbi jdbi;

    private static void connect() {
        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setURL("jdbc:mysql://" + DBProperties.HOST + ":" + DBProperties.PORT + "/" + DBProperties.DBNAME);
        dataSource.setUser(DBProperties.USERNAME);
        dataSource.setPassword(DBProperties.PASSWORD);
        try {
            dataSource.setAutoReconnect(true);
            dataSource.setUseCompression(true);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        jdbi = Jdbi.create(dataSource);

    }

    public JDBIConector() {
    }

    public static Jdbi me() {
        if (jdbi == null) connect();
        return jdbi;
    }

    public static void main(String[] args) {
        connect();
    }
}
