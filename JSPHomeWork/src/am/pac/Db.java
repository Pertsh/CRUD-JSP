package am.pac;

import java.sql.Connection;
import java.sql.DriverManager;


public class Db {
    private static Connection connection = null;

    public static Connection connector() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost/clients", "root", "root");
        return connection;
    }
}

