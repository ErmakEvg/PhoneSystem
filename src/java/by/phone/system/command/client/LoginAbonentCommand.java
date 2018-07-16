/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package by.phone.system.command.client;

import by.phone.system.command.admin.LoginCommand;
import by.phone.system.model.Abonent;
import by.phone.system.logic.LoginLogic;
import by.phone.system.resource.ConfigurationManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import by.phone.system.command.ActionCommand;
/**
 *
 * @author user
 */
public class LoginAbonentCommand implements ActionCommand{

    private static final String PARAM_NAME_LOGIN = "login";
    private static final String PARAM_NAME_PASSWORD = "password";
    
    @Override
    public String execute(HttpServletRequest request) {
        String page= null;
        String login = request.getParameter(PARAM_NAME_LOGIN);
        String pass = request.getParameter(PARAM_NAME_PASSWORD);
        HttpSession session = request.getSession();
        Abonent abonent;
        try {
            abonent = LoginLogic.checkLoginAbonent(login, pass);
            if (abonent.isBlock()) {
                request.setAttribute("block", true);
            }
            else
                session.setAttribute("block", false);
            if(abonent.getId() != 0) {
                session.setAttribute("abonent", abonent);
                session.setAttribute("auth", true);
                session.setAttribute("error", false);
                page = ConfigurationManager.getProperty("path.page.abonent.index");
            } else {
                session.setAttribute("auth", false);
                session.setAttribute("error", true);
                page = ConfigurationManager.getProperty("path.page.abonent.index");
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
        return page;
    }
}
