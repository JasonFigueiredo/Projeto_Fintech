package br.com.fiap.projeto_fintech.factory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
    private static final String URL = "RM559562@//oracle.fiap.com.br:1521/ORCL";
    private static final String USER = "RM559562";
    private static final String PASS = "171099";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASS);
    }
}
