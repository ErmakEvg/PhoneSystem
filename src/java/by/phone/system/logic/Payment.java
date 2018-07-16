/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package by.phone.system.logic;

import by.phone.system.dao.AbonentDAO;
import by.phone.system.dao.InvoiceDAO;
import by.phone.system.dao.ServiceDAO;
import by.phone.system.dao.pool.ConnectionPool;
import by.phone.system.model.Abonent;
import by.phone.system.model.Invoice;
import by.phone.system.model.Service;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author user
 */
public class Payment {
    
    public static boolean paymentInvoice(int id) throws SQLException {
        Abonent abonent = new Abonent();
        Connection conn = ConnectionPool.getConnection();
        AbonentDAO abonentDAO = new AbonentDAO(conn);
        InvoiceDAO invoiceDAO = new InvoiceDAO(conn);
        ServiceDAO serviceDAO = new ServiceDAO(conn);
        Invoice invoice = invoiceDAO.findEntityById(id);
        abonent = abonentDAO.findEntityById(invoice.getAbonent().getId());
        double currentMooney = abonent.getCountMooney();
        Service service = new Service();
        service = serviceDAO.findEntityById(invoice.getService().getId());
        double paymentMooney = service.getPrice();
        if (currentMooney > paymentMooney){
            double mooney = currentMooney - paymentMooney;
            abonent.setCountMooney(mooney);
            invoice.setPaid(true);
            invoiceDAO.update(invoice);
            abonentDAO.updateMooney(abonent);
            conn.close();
            return true;
        }
        else {
            return false;
        }
    }
    
}
