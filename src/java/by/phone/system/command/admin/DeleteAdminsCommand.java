/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package by.phone.system.command.admin;
import by.phone.system.command.ActionCommand;
import by.phone.system.dao.AdminDAO;
import by.phone.system.dao.pool.ConnectionPool;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author user
 */
public class DeleteAdminsCommand implements ActionCommand{

    public String execute(HttpServletRequest request) {
        String page= null;
        Connection conn;
        try {
            conn = ConnectionPool.getConnection();
            String id = request.getParameter("id");
            AdminDAO ab = new AdminDAO(conn);
            ab.delete(Integer.parseInt(id));
        } catch (SQLException ex) {
            Logger.getLogger(AddAbonentsCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
        GetAdminsCommand get = new GetAdminsCommand();
        page = get.execute(request);
        return page;
    }
    
}
