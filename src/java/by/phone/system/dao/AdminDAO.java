/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package by.phone.system.dao;

import by.phone.system.dao.pool.ConnectionPool;
import by.phone.system.model.Admin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author user
 */
public class AdminDAO extends AbstractDAO <Admin>{
    
    private final String SQL_SELECT_BY_LOGIN_AND_PASSWORD = "Select * from admins where login=? and password=?";
    private final String SQL_DELETE_ADMIN = "Delete from admins where id=?";
    private final String SQL_ADD_ADMIN = "Insert into admins values(?,?,?,?,?,?)";
    private final String SQL_SELECT_ALL = "Select * from admins";
    
    public AdminDAO(Connection connection) {
        super(connection);
    }

    public Admin checkAdmin(String login, String password) {
        Admin admin = new Admin();
        PreparedStatement st = null;
        try {
            st = connection.prepareStatement(SQL_SELECT_BY_LOGIN_AND_PASSWORD);
            st.setString(1, login);
            st.setString(2, password);
            ResultSet resultSet = st.executeQuery();
            if (resultSet.next()) {
                admin.setId(resultSet.getInt("id"));
                admin.setLogin(resultSet.getString("login"));
                admin.setPassword(resultSet.getString("password"));
                admin.setFirtsName(resultSet.getString("firstname"));
                admin.setMiddleName(resultSet.getString("middlename"));
                admin.setLastName(resultSet.getString("lastname"));
            }
        } catch(SQLException e) {
            System.err.println("SQL exception (request or table failed): " + e);
        } finally {
            close(st);
        }
        return admin;
    }
    
    @Override
    public List<Admin> findAll() {
        List<Admin> admins = new ArrayList<Admin>();
        Statement st = null;
        try {
            st = connection.createStatement();
            ResultSet resultSet = st.executeQuery(SQL_SELECT_ALL);
            while(resultSet.next()) {
                Admin admin = new Admin();
                admin.setId(resultSet.getInt("id"));
                admin.setLogin(resultSet.getString("login"));
                admin.setPassword(resultSet.getString("password"));
                admin.setFirtsName(resultSet.getString("firstname"));
                admin.setMiddleName(resultSet.getString("middlename"));
                admin.setLastName(resultSet.getString("lastname"));
                admins.add(admin);
            }
        } catch(SQLException e) {
            System.err.println("SQL exception (request or table failed): " + e);
        } finally {
            close(st);
        }
        return admins;
    }

    @Override
    public Admin findEntityById(int id) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean delete(int id) {
        PreparedStatement st = null;
        try {
            st = connection.prepareStatement(SQL_DELETE_ADMIN);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AbonentDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } finally {
            close(st);
        }
        return true;
    }

    @Override
    public boolean delete(Admin entity) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean create(Admin entity) {
        PreparedStatement st = null;
        try {
            st = connection.prepareStatement(SQL_ADD_ADMIN);
            st.setInt(1, entity.getId());
            st.setString(2, entity.getFirtsName());
            st.setString(3, entity.getMiddleName());
            st.setString(4, entity.getLastName());
            st.setString(5, entity.getLogin());
            st.setString(6, entity.getPassword());
            st.executeUpdate();
        } catch(SQLException e) {
            System.err.println("SQL exception (request or table failed): " + e);
        } finally{
            close(st);
        }     
        return true;
    }

    @Override
    public Admin update(Admin entity) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

}
