/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package by.phone.system.logic;

import by.phone.system.dao.InvoiceDAO;
import by.phone.system.dao.pool.ConnectionPool;
import by.phone.system.model.Invoice;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author user
 */
public class ServiceLogic {
    
    public static int [] countByMonth() {
        int[] count = new int[12];
        Connection conn;
        try {
            conn = ConnectionPool.getConnection();
            InvoiceDAO serviceDAO = new InvoiceDAO(conn);
            List<Invoice> invoices = serviceDAO.findAll();
            for (Invoice invoice : invoices) {
                int month = invoice.getDateStart().getMonth();
                count[month] = count[month] + 1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServiceLogic.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return count;
    }
}
