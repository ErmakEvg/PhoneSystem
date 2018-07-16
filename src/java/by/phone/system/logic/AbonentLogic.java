/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package by.phone.system.logic;

import by.phone.system.dao.AbonentDAO;
import by.phone.system.dao.pool.ConnectionPool;
import by.phone.system.model.Abonent;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author user
 */
public class AbonentLogic {
    
    public static int countNewAbonent() {
        int count = 0;
        try {
            Connection conn = ConnectionPool.getConnection();
            AbonentDAO abonentDAO = new AbonentDAO(conn);
            List<Abonent> abonents = abonentDAO.findAll();
            Calendar call = Calendar.getInstance();
            Date currentDate = call.getTime();
            for (Abonent abonent : abonents) {
                if (abonent.getDateRegistr() != null) {
                    Date abonDate = abonent.getDateRegistr();
                    if (currentDate.getDate() == abonDate.getDate() && currentDate.getMonth() == abonDate.getMonth() && currentDate.getYear() == abonDate.getYear())
                        count++;
                }
            }
            return count;
        } catch (SQLException ex) {
            Logger.getLogger(AbonentLogic.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
}
