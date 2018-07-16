/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package by.phone.system.command.client;
import by.phone.system.command.ActionCommand;
import by.phone.system.resource.ConfigurationManager;
import by.phone.system.resource.ResourceManager;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author user
 */
public class LogoutAbonentCommand implements ActionCommand {
        @Override
        public String execute(HttpServletRequest request) {
        String page = ConfigurationManager.getProperty("path.page.abonent.index");
        request.getSession().invalidate();
        ResourceManager manager = ResourceManager.INSTANCE;
        request.getSession().setAttribute("manager", manager);
        return page;
    }
}
