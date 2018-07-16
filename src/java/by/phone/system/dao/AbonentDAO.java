/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package by.phone.system.dao;

import by.phone.system.model.Abonent;
import by.phone.system.model.Service;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author user
 */
public class AbonentDAO extends AbstractDAO<Abonent> {
    
    private final String SQL_SELECT_BY_ID = "Select * from abonents where id=?";
    private final String SQL_SELECT_ALL = "Select * from abonents";
    private final String SQL_FIND_BY_LOGIN_AND_PASSWORD = "Select * from abonents where login=? and password=?";
    private final String SQL_ADD_ABONENTS = "Insert into abonents values(?,?,?,?,?,?,?,?,?,?,?,?, 0 ,0 , ?)";
    private final String SQL_UPDATE_ABONENT = "UPDATE abonents set firstname=?, datebirthday=?, login=?, password=?, middlename=?, lastname=?, city=?, street=?, homephonenumber=?, mobphonenumber=?, numberpasport=? where id=?";
    private final String SQL_BLOCK_ABONENT = "UPDATE abonents set block=1 where id=?";
    private final String SQL_UPDATE_ABONENT_MOONEY = "UPDATE abonents set countmoney=? where id=?";
    private final String SQL_UNBLOCK_ABONENT = "UPDATE abonents set block=0 where id=?";
    private final String SQL_DELETE_ABONENT = "Delete from abonents where id=?";
 
    public AbonentDAO(Connection connection) {
        super(connection);
    }
    
    @Override
    public List<Abonent> findAll() {
        List<Abonent> list = new ArrayList<Abonent>();
        Statement st = null;
        try {
            st = connection.createStatement();
            ResultSet resultSet = st.executeQuery(SQL_SELECT_ALL);
            while(resultSet.next()) {
                Abonent ab = new Abonent();
                ab.setId(resultSet.getInt("id"));
                ab.setLogin(resultSet.getString("login"));
                ab.setPassword(resultSet.getString("password"));
                ab.setFirstName(resultSet.getString("firstname"));
                ab.setMiddleName(resultSet.getString("middlename"));
                ab.setLastName(resultSet.getString("lastname"));
                ab.setBlock(resultSet.getBoolean("block"));
                ab.setHomePhoneNumber(resultSet.getString("homephonenumber"));
                ab.setDateRegistr(resultSet.getDate("dateregistr"));
                list.add(ab);
            }
        } catch(SQLException e) {
            System.err.println("SQL exception (request or table failed): " + e);
        } finally   {
            close(st);
        }     
        return list;
    }

    @Override
    public Abonent findEntityById(int id) {
        Abonent abonent = new Abonent();
        PreparedStatement st = null;
        try {
            SimpleDateFormat sd = new SimpleDateFormat("dd-MM-yyyy");
            st = connection.prepareStatement(SQL_SELECT_BY_ID);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                abonent.setCity(rs.getString("city"));
                abonent.setId(id);
                abonent.setFirstName(rs.getString("firstname"));
                try {
                    abonent.setDateOfBirthday(sd.parse(rs.getString("datebirthday")));
                } catch (ParseException ex) {
                    Logger.getLogger(AbonentDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
                abonent.setLogin(rs.getString("login"));
                abonent.setPassword(rs.getString("password"));
                abonent.setMiddleName(rs.getString("middlename"));
                abonent.setLastName(rs.getString("lastname"));
                abonent.setStreet(rs.getString("street"));
                abonent.setHomePhoneNumber(rs.getString("homephonenumber"));
                abonent.setMobPhoneNumber(rs.getString("mobphonenumber"));
                abonent.setNumberPassport(rs.getString("numberpasport"));
                abonent.setCountMooney(rs.getDouble("countmoney"));
                abonent.setDateOfBirthday(rs.getDate("datebirthday"));
                abonent.setDateRegistr(rs.getDate("dateregistr"));
            }
            rs = st.executeQuery("Select * from abonentservices inner join services on idService=services.id where idAbonent=" + id);
            while(rs.next()) {
                Service service = new Service();
                service.setId(rs.getInt("idService"));
                service.setDescription(rs.getString("description"));
                service.setName(rs.getString("name"));
                service.setPrice(rs.getDouble("price"));
                abonent.addService(service);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AbonentDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            close(st);
        }    
        return abonent;
    }

    @Override
    public boolean delete(int id) {
        PreparedStatement st;
        try {
            st = connection.prepareStatement(SQL_DELETE_ABONENT);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AbonentDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }

    @Override
    public boolean delete(Abonent entity) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean create(Abonent entity) {
        PreparedStatement st = null;
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        try {
            st = connection.prepareStatement(SQL_ADD_ABONENTS);
            st.setInt(1, entity.getId());
            st.setString(2, entity.getFirstName());
            st.setString(3,  sd.format(entity.getDateOfBirthday()));
            st.setString(4, entity.getLogin());
            st.setString(5, entity.getPassword());
            st.setString(6, entity.getMiddleName());
            st.setString(7, entity.getLastName());
            st.setString(8, entity.getCity());
            st.setString(9, entity.getStreet());
            st.setString(10, entity.getHomePhoneNumber());
            st.setString(11, entity.getMobPhoneNumber());
            st.setString(12, entity.getNumberPassport());
            st.setString(13, sd.format(entity.getDateRegistr()));
            st.executeUpdate();
        } catch(SQLException e) {
            System.err.println("SQL exception (request or table failed): " + e);
        } finally   {
            close(st);
        }     
        return true;
    }

    @Override
    public Abonent update(Abonent entity) {
        PreparedStatement st = null;
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        try{
            st = connection.prepareStatement(SQL_UPDATE_ABONENT);
            st.setString(1, entity.getFirstName());
            st.setString(2, sd.format(entity.getDateOfBirthday()));
            st.setString(3, entity.getLogin());
            st.setString(4, "189");
            st.setString(5, entity.getMiddleName());
            st.setString(6, entity.getLastName());
            st.setString(7, entity.getCity());
            st.setString(8, entity.getStreet());
            st.setString(9, entity.getHomePhoneNumber());
            st.setString(10, entity.getMobPhoneNumber());
            st.setString(11, entity.getNumberPassport());
            st.setInt(12, entity.getId());
            st.executeUpdate();    
        } catch(SQLException e) {
            System.err.println("SQL exception (request or table failed): " + e);
        } finally   {
            close(st);
        }     
        return entity;
    }
    
    public void blockingAbonent(int id) {
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(SQL_BLOCK_ABONENT);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AbonentDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            close(ps);
        }     
    }
    
    public void unBlockingAbonent(int id) {
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(SQL_UNBLOCK_ABONENT);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AbonentDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            close(ps);
        }     
    }

    public Abonent findByLoginAndPassword(String login, String password) {
        Abonent abonent = new Abonent();
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(SQL_FIND_BY_LOGIN_AND_PASSWORD);
            ps.setString(1, login);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                abonent.setLogin(rs.getString("login"));
                abonent.setFirstName(rs.getString("firstname"));
                abonent.setPassword(rs.getString("password"));
                abonent.setMiddleName(rs.getString("middlename"));
                abonent.setLastName(rs.getString("lastname"));
                abonent.setStreet(rs.getString("street"));
                abonent.setHomePhoneNumber(rs.getString("homephonenumber"));
                abonent.setMobPhoneNumber(rs.getString("mobphonenumber"));
                abonent.setNumberPassport(rs.getString("numberpasport"));
                abonent.setCountMooney(rs.getDouble("countmoney"));
                abonent.setDateOfBirthday(rs.getDate("datebirthday"));
                abonent.setDateRegistr(rs.getDate("dateregistr"));
                abonent.setId(rs.getInt("id"));
                if (rs.getByte("block") == 1) {
                    abonent.setBlock(true);
                }
                else
                    abonent.setBlock(false);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AbonentDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            close(ps);
        }    
        return abonent;
    }
    
    public void updateMooney(Abonent abonent) {
        PreparedStatement st = null;
        try {
            st = connection.prepareStatement(SQL_UPDATE_ABONENT_MOONEY);
            st.setDouble(1, abonent.getCountMooney());
            st.setInt(2, abonent.getId());
            st.executeUpdate();
        } catch(SQLException e) {
            System.err.println("SQL exception (request or table failed): " + e);
        } finally {
            close(st);
        }   
    }
}
