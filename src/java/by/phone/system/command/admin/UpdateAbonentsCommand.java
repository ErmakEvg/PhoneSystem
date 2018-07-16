/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package by.phone.system.command.admin;
import by.phone.system.command.ActionCommand;
import by.phone.system.dao.AbonentDAO;
import by.phone.system.dao.pool.ConnectionPool;
import by.phone.system.model.Abonent;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author user
 */
public class UpdateAbonentsCommand implements ActionCommand {

    public String execute(HttpServletRequest request) {
        String page= null;
        Connection conn;
        try {
            conn = ConnectionPool.getConnection();
            String firstname = request.getParameter("firstname");
            String middlename = request.getParameter("middlename");
            String lastname = request.getParameter("lastname");
            String id = request.getParameter("id");
            String password = request.getParameter("passwordclient");
            String homephonenumber = request.getParameter("homephonenumber");
            String city = request.getParameter("city");
            String phonenumber = request.getParameter("phonenumber");
            String street = request.getParameter("street");
            String numberpasport = request.getParameter("numpasport");
            String login = request.getParameter("numclient");
            String dateBirthDay = request.getParameter("datebirthday");
            Abonent abonent = new Abonent();
            abonent.setFirstName(firstname);
            abonent.setMiddleName(middlename);
            abonent.setLastName(lastname);
            abonent.setId(Integer.parseInt(id));
            abonent.setCity(city);
            abonent.setHomePhoneNumber(homephonenumber);
            abonent.setMobPhoneNumber(phonenumber);
            abonent.setNumberPassport(numberpasport);
            abonent.setStreet(street);
            abonent.setPassword(password);
            request.setAttribute("id", id);
            request.setAttribute("flag", "1");
            abonent.setLogin(login);
            DateFormat format = new SimpleDateFormat("dd-MM-yyyy");          
            Date date;
            try {
                date = format.parse(dateBirthDay);
                abonent.setDateOfBirthday(date);
            } catch (ParseException ex) {
                Logger.getLogger(AddAbonentsCommand.class.getName()).log(Level.SEVERE, null, ex);
            }
            AbonentDAO ab = new AbonentDAO(conn);
            ab.update(abonent); 
        } catch (SQLException ex) {
            Logger.getLogger(AddAbonentsCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
        DetailUserCommand get = new DetailUserCommand();
        request.setAttribute("role", "adm");
        page = get.execute(request);
        return page;
    }
    
}
