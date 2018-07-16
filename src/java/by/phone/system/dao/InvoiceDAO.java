/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package by.phone.system.dao;

import by.phone.system.model.Abonent;
import by.phone.system.model.Entity;
import by.phone.system.model.Invoice;
import by.phone.system.model.Service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author user
 */
public class InvoiceDAO extends AbstractDAO<Invoice> {
    
    private final String SQL_ADD_SERVICE_FOR_ABONENT = "Insert into abonentservices values(?,?,?,?, 0)";
    private final String SQL_UPDATE_INVOICE = "UPDATE abonentservices set paid=? where id=?";
    private final String SQL_SELECT_INVOICE = "Select * from abonentservices where id=?";
    private final String SQL_SELECT_ALL = "Select * from abonentservices";

    public InvoiceDAO(Connection connection) {
        super(connection);
    }
    @Override
    public List<Invoice> findAll() {
        List<Invoice> invoices = new ArrayList<Invoice>();
        Statement st = null;
        try {
            st = connection.createStatement();
            ResultSet rs = st.executeQuery(SQL_SELECT_ALL);
            while (rs.next()) {
                Abonent abonent = new Abonent();
                Service service = new Service();
                Invoice invoice = new Invoice();
                invoice.setId(rs.getInt("id"));
                abonent.setId(rs.getInt("idAbonent"));
                service.setId(rs.getInt("idService"));
                invoice.setAbonent(abonent);
                invoice.setService(service);
                invoice.setDateStart(rs.getDate("datestart"));
                invoice.setPaid(rs.getBoolean("paid"));
                invoices.add(invoice);
            }
        } catch (SQLException ex) {
            Logger.getLogger(InvoiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            close(st);
        }   
        return invoices;
    }

    @Override
    public Invoice findEntityById(int id) {
        Invoice invoice = new Invoice();
        PreparedStatement st = null;
        try {
            st = connection.prepareStatement(SQL_SELECT_INVOICE);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Abonent abonent = new Abonent();
                Service service = new Service();
                invoice.setId(rs.getInt("id"));
                abonent.setId(rs.getInt("idAbonent"));
                service.setId(rs.getInt("idService"));
                invoice.setAbonent(abonent);
                invoice.setService(service);
                invoice.setDateStart(rs.getDate("datestart"));
                invoice.setPaid(rs.getBoolean("paid"));
        }
        } catch (SQLException ex) {
            Logger.getLogger(InvoiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally{
            close(st);
        }   
        return invoice;
    }

    @Override
    public boolean delete(int id) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean delete(Invoice entity) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean create(Invoice entity) {
        PreparedStatement st = null;
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        try {
            st = connection.prepareStatement(SQL_ADD_SERVICE_FOR_ABONENT);
            st.setInt(1, entity.getId());
            st.setInt(2, entity.getAbonent().getId());
            st.setInt(3, entity.getService().getId());
            st.setString(4, sd.format(entity.getDateStart()));
            st.executeUpdate();
        } catch(SQLException e) {
            System.err.println("SQL exception (request or table failed): " + e);
        } finally {
            close(st);
        }     
        return true;
    }

    @Override
    public Invoice update(Invoice entity) {
        PreparedStatement st = null;
        try {
            st = connection.prepareStatement(SQL_UPDATE_INVOICE);
            if(entity.isPaid())
                st.setInt(1, 1);
            else
                st.setInt(1, 0);
            st.setInt(2, entity.getId());
            st.executeUpdate();
        } catch(SQLException e) {
            System.err.println("SQL exception (request or table failed): " + e);
        } finally {
            close(st);
        }     
        return entity;
    }
    
    public List<Invoice> findByIdAbonent(int id) {
        List<Invoice> invoices = new ArrayList<Invoice>();
        Statement st = null;
        try {
            st = connection.createStatement();
            ResultSet rs = st.executeQuery("SELECT * from abonentservices inner join services on abonentservices.idService=services.id where abonentservices.idAbonent=" + id);
            while(rs.next()) {
                Invoice invoice = new Invoice();
                Abonent abonent = new Abonent();
                Service service = new Service();
                invoice.setId(rs.getInt("id"));
                abonent.setId(id);
                service.setId(rs.getInt("idService"));
                service.setDescription(rs.getString("description"));
                service.setName(rs.getString("name"));
                service.setPrice(rs.getDouble("price"));
                invoice.setAbonent(abonent);
                invoice.setService(service);
                invoice.setDateStart(rs.getDate("datestart"));
                invoice.setPaid(rs.getBoolean("paid"));
                invoices.add(invoice);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AbonentDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            close(st);
        }   
        return invoices;
    }
    
    public int count() {
        Statement st = null;
        int i = 0;
        try {
            st = connection.createStatement();
            ResultSet rs = st.executeQuery(SQL_SELECT_ALL);
            while(rs.next()) {
              i++;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AbonentDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            close(st);
        }   
        return i;
    }
}
