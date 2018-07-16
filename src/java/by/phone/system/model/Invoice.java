/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package by.phone.system.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author user
 */
public class Invoice extends Entity {

    private Abonent abonent;
    private Service service;
    private Date dateStart;
    private boolean paid;

    public Invoice() {
    }

    /**
     * @return the abonent
     */
    public Abonent getAbonent() {
        return abonent;
    }

    /**
     * @param abonent the abonent to set
     */
    public void setAbonent(Abonent abonent) {
        this.abonent = abonent;
    }

    /**
     * @return the service
     */
    public Service getService() {
        return service;
    }

    /**
     * @param service the service to set
     */
    public void setService(Service service) {
        this.service = service;
    }

    /**
     * @return the dateStart
     */
    public Date getDateStart() {
        return dateStart;
    }

    /**
     * @param dateStart the dateStart to set
     */
    public void setDateStart(Date dateStart) {
        this.dateStart = dateStart;
    }

    /**
     * @return the paid
     */
    public boolean isPaid() {
        return paid;
    }

    /**
     * @param paid the paid to set
     */
    public void setPaid(boolean paid) {
        this.paid = paid;
    }

    
    
}
