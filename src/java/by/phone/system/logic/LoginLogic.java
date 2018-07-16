/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package by.phone.system.logic;

import by.phone.system.dao.AbonentDAO;
import by.phone.system.dao.AdminDAO;
import by.phone.system.dao.pool.ConnectionPool;
import by.phone.system.model.Abonent;
import by.phone.system.model.Admin;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author user
 */
public class LoginLogic {

    public static Admin checkLogin(String enterLogin, String enterPass) throws SQLException {
        Connection conn = ConnectionPool.getConnection();
        conn.setAutoCommit(false);
        AdminDAO adminDAO = new AdminDAO(conn);
        Admin adminCheck = adminDAO.checkAdmin(enterLogin, enterPass);
        return adminCheck;
    }

    public static Abonent checkLoginAbonent(String enterLogin, String enterPass) throws SQLException {
        Connection conn = ConnectionPool.getConnection();
        conn.setAutoCommit(false);
        AbonentDAO adminDAO = new AbonentDAO(conn);
        Abonent abonent = adminDAO.findByLoginAndPassword(enterLogin, enterPass);
        return abonent;
    }
}
