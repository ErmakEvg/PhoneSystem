/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package by.phone.system.command.admin;
import by.phone.system.command.ActionCommand;
import by.phone.system.model.Admin;
import by.phone.system.logic.LoginLogic;
import by.phone.system.resource.ConfigurationManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class LoginCommand implements ActionCommand {
    
    private static final String PARAM_NAME_LOGIN= "login";
    private static final String PARAM_NAME_PASSWORD= "password";
    
    @Override
    public String execute(HttpServletRequest request) {
        String page= null;
        String login = request.getParameter(PARAM_NAME_LOGIN);
        String pass = request.getParameter(PARAM_NAME_PASSWORD);
        
        Admin admin;
        try {
            admin = LoginLogic.checkLogin(login, pass);
            if(admin.getId() != 0) {
                request.setAttribute("admin", admin);
                HttpSession session = request.getSession();
                session.setAttribute("admin", admin);
                GetMainCommand main = new GetMainCommand();
                page = main.execute(request);
            } else {
                request.setAttribute("flag", 1);
                page = ConfigurationManager.getProperty("path.page.login.admin");
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
      
        return page;
    }
}
