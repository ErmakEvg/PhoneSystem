/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package by.phone.system.command.client;
import by.phone.system.command.ActionCommand;
import by.phone.system.dao.InvoiceDAO;
import by.phone.system.dao.pool.ConnectionPool;
import by.phone.system.model.Abonent;
import by.phone.system.model.Invoice;
import by.phone.system.model.Service;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author user
 */
public class AddServiceForCommand implements ActionCommand
{

    public String execute(HttpServletRequest request) {
        String page = null;
        int idS = Integer.parseInt(request.getParameter("idS"));
        int idAb = Integer.parseInt(request.getParameter("idA"));
        Connection conn;
        try {
            conn = ConnectionPool.getConnection();
            InvoiceDAO invoiceDAO = new InvoiceDAO(conn);
            Invoice invoice = new Invoice();
            Abonent abonent = new Abonent();
            abonent.setId(idAb);
            Service service = new Service();
            service.setId(idS);
            Calendar cal = Calendar.getInstance();
            invoice.setAbonent(abonent);
            invoice.setService(service);
            invoice.setPaid(false);
            invoice.setDateStart(cal.getTime());
            invoiceDAO.create(invoice);
        } catch (SQLException ex) {
            Logger.getLogger(AddServiceForCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
        GetServicesClientCommand get = new GetServicesClientCommand();
        page = get.execute(request);
        return page;
    }
    
}
