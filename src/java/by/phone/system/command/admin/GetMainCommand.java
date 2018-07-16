/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package by.phone.system.command.admin;
import by.phone.system.command.ActionCommand;
import by.phone.system.dao.AbonentDAO;
import by.phone.system.dao.InvoiceDAO;
import by.phone.system.dao.pool.ConnectionPool;
import by.phone.system.logic.AbonentLogic;
import by.phone.system.logic.ServiceLogic;
import by.phone.system.resource.ConfigurationManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author user
 */
public class GetMainCommand implements ActionCommand{

    public String execute(HttpServletRequest request) {
        try {
            Connection conn = ConnectionPool.getConnection();
            AbonentDAO abonentDAO = new AbonentDAO(conn);
            int s = abonentDAO.findAll().size();
            InvoiceDAO invoiceDAO = new InvoiceDAO(conn);
            request.setAttribute("countAbonent", s);
            request.setAttribute("countService", invoiceDAO.count());
            request.setAttribute("countNewAbonent", AbonentLogic.countNewAbonent());
            
            request.setAttribute("countByMonth", ServiceLogic.countByMonth());
        } catch (SQLException ex) {
            Logger.getLogger(GetMainCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ConfigurationManager.getProperty("path.page.admin.main");
    }
    
}
