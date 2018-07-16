/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package by.phone.system.command.client;
import by.phone.system.command.ActionCommand;
import by.phone.system.resource.ConfigurationManager;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author user
 */
public class GetContactsCommand implements ActionCommand{

    public String execute(HttpServletRequest request) {
        String page = ConfigurationManager.getProperty("path.page.abonent.contacts");
        return page;
    }
    
}
