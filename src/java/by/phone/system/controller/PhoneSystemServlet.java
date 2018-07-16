/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package by.phone.system.controller;
import by.phone.system.command.ActionCommand;
import by.phone.system.command.factory.ActionFactory;
import by.phone.system.resource.ConfigurationManager;
import by.phone.system.resource.MessageManager;
import by.phone.system.resource.ResourceManager;
import java.io.IOException;
import java.util.Locale;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class PhoneSystemServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        String page= null;
        ActionFactory client = new ActionFactory();

        
        ActionCommand command = client.defineCommand(request);
        page=command.execute(request);
        if(page != null) 
        {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(page);
            dispatcher.forward(request, response);
            ResourceManager manager = ResourceManager.INSTANCE;
         manager.changeResource(new Locale("ru","RU"));
            request.getSession().setAttribute("manager", manager);
        } 
        else
        {
            
            page = ConfigurationManager.getProperty("path.page.index");
            request.getSession().setAttribute("nullPage", MessageManager.getProperty("message.nullpage"));
            response.sendRedirect(request.getContextPath() + page);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
