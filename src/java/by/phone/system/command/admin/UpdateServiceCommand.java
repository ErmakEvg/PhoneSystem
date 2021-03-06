/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package by.phone.system.command.admin;
import by.phone.system.command.ActionCommand;
import by.phone.system.dao.ServiceDAO;
import by.phone.system.dao.pool.ConnectionPool;
import by.phone.system.model.Service;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author user
 */
public class UpdateServiceCommand implements ActionCommand{

    public String execute(HttpServletRequest request) {
        String page= null;
        Connection conn;
        try {
            conn = ConnectionPool.getConnection();
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String price = request.getParameter("price");
            Service service = new Service();
            service.setDescription(description);
            service.setName(name);
            service.setPrice(Double.parseDouble(price));
            service.setId(Integer.parseInt(id));
            request.setAttribute("id", id);
            ServiceDAO ab = new ServiceDAO(conn);
            ab.update(service);
        } catch (SQLException ex) {
            Logger.getLogger(AddAbonentsCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
        DetailServiceCommand get = new DetailServiceCommand();
        page = get.execute(request);
        return page;
    }
    
}
