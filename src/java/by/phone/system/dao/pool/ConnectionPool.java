/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package by.phone.system.dao.pool;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author user
 */
public class ConnectionPool {
    
    private static final String DATASOURCE_NAME= "jdbc/phonesystem";
    private static DataSource dataSource;
    static {
    try {
        Context initContext = new InitialContext();
        Context envContext = (Context) initContext.lookup("java:/comp/env");
        dataSource = (DataSource) envContext.lookup(DATASOURCE_NAME);
    } catch(NamingException e) {
            e.printStackTrace();
    }
    }
    private ConnectionPool() { }
    
    public static Connection getConnection() throws SQLException {
        Connection connection = dataSource.getConnection();
        return connection;
    }
}