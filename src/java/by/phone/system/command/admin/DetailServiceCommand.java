/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package by.phone.system.command.admin;
import by.phone.system.command.ActionCommand;
import by.phone.system.dao.ServiceDAO;
import by.phone.system.dao.pool.ConnectionPool;
import by.phone.system.model.Service;
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
public class DetailServiceCommand implements ActionCommand{

   public String execute(HttpServletRequest request) {
        String id = request.getParameter("id");
        String page = null;
        Service ab = null;
        try {
           Connection conn = ConnectionPool.getConnection();
           ServiceDAO abDAO = new ServiceDAO(conn);
           ab = abDAO.findEntityById(Integer.parseInt(id));
           request.setAttribute("service", ab);
        } catch (SQLException ex) {
            Logger.getLogger(DetailUserCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
        page = ConfigurationManager.getProperty("path.page.admin.detailservice");
        return page;
    } 
}
