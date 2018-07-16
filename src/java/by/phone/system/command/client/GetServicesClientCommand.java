/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package by.phone.system.command.client;

import by.phone.system.command.admin.GetAbonentsCommand;
import by.phone.system.dao.ServiceDAO;
import by.phone.system.dao.pool.ConnectionPool;
import by.phone.system.model.Service;
import by.phone.system.resource.ConfigurationManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import by.phone.system.command.ActionCommand;
/**
 *
 * @author user
 */
public class GetServicesClientCommand implements ActionCommand{

   public String execute(HttpServletRequest request) {
        String page= null;
        List<Service> services = null;
        try {
            Connection conn = ConnectionPool.getConnection();
            ServiceDAO serviceDao = new ServiceDAO(conn);
            services = serviceDao.findAll();
            request.setAttribute("services", services);
            page = ConfigurationManager.getProperty("path.page.abonent.services");
        } catch (SQLException ex) {
            Logger.getLogger(GetAbonentsCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
        return page;
    }
    
}
