/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package by.phone.system.command.admin;
import by.phone.system.command.ActionCommand;
import by.phone.system.dao.AdminDAO;
import by.phone.system.dao.pool.ConnectionPool;
import by.phone.system.model.Admin;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author user
 */
public class AddAdminCommand implements ActionCommand{

    public String execute(HttpServletRequest request) {
        String page= null;
        Connection conn;
        try {
            String id = request.getParameter("id");
            String fName = request.getParameter("firstname");
            String mName = request.getParameter("middlename");
            String lName = request.getParameter("lastname");
            String login = request.getParameter("login");
            String password = request.getParameter("password");
            Admin admin = new Admin();
            admin.setId(Integer.parseInt(id));
            admin.setFirtsName(fName);
            admin.setMiddleName(mName);
            admin.setLastName(lName);
            admin.setLogin(login);
            admin.setPassword(password);
            conn = ConnectionPool.getConnection();
            AdminDAO ab = new AdminDAO(conn);
            ab.create(admin);
        } catch (SQLException ex) {
            Logger.getLogger(AddAbonentsCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
        GetAdminsCommand get = new GetAdminsCommand();
        page = get.execute(request);
        return page;
    }
    
}
