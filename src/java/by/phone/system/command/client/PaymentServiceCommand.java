/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package by.phone.system.command.client;
import by.phone.system.command.ActionCommand;
import by.phone.system.command.admin.DetailUserCommand;
import by.phone.system.model.Abonent;
import by.phone.system.logic.Payment;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author user
 */
public class PaymentServiceCommand implements ActionCommand{

    public String execute(HttpServletRequest request) {
        String idInvoice = request.getParameter("idS");
        try {
            boolean paid = Payment.paymentInvoice(Integer.parseInt(idInvoice));
            if (paid) {
                request.setAttribute("paid", true);
            } else {
                request.setAttribute("paid", false);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PaymentServiceCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("role", "cl");
        Abonent abonent = new Abonent();
        abonent = (Abonent)request.getSession().getAttribute("abonent");
        request.setAttribute("id", abonent.getId());
        DetailUserCommand det = new DetailUserCommand();
        String page = det.execute(request);
        return page;
    }
    
}
