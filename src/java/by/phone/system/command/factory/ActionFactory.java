/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package by.phone.system.command.factory;

import by.phone.system.command.ActionCommand;
import by.phone.system.command.client.EmptyCommand;
import by.phone.system.resource.MessageManager;
import by.phone.system.resource.ResourceManager;
import java.util.Locale;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author user
 */
public class ActionFactory {
    public ActionCommand defineCommand(HttpServletRequest request) {
        ActionCommand current = new EmptyCommand();
        String action = request.getParameter("action");
        ResourceManager manager = ResourceManager.INSTANCE;
        if(action == null|| action.isEmpty()) {
            return current;
        }
        try {
            if (action.compareTo("changelang") == 0) {
                String l = request.getParameter("l");
                if (l.compareTo("ru") == 0) {
                    manager.changeResource(new Locale("ru","RU"));
                    
                    action="gethomepageabonent";
                }
                if (l.compareTo("en") == 0) {

                    manager.changeResource(new Locale("en","US"));
                    request.getSession().setAttribute("manager", manager);
                    action="gethomepageabonent";
                }
            }
            request.getSession().setAttribute("manager", manager);
            CommandEnum currentEnum =CommandEnum.valueOf(action.toUpperCase());
            current = currentEnum.getCurrentCommand();
           
        } catch(IllegalArgumentException e) {
            request.setAttribute("wrongAction", MessageManager.getProperty("message.wrongaction"));
        }
        return current;
    }   
}
