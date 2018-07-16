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
public class Abonent extends User {
    private String firstName;
    private String middleName;
    private String lastName;
    private Date dateOfBirthday;
    private String city;
    private String street;
    private String homePhoneNumber;
    private String mobPhoneNumber;
    private String numberPassport;
    private double countMooney;
    private boolean block;
    private Date dateRegistr;
    
    private List<Service> services;
    
    public List<Service> getServices() {
        return services;
    }

    public Abonent() {
        services = new ArrayList<Service>();
    }

    public Abonent(String firstName, String middleName, String lastName, Date dateOfBirthday, String city, String street, String homePhoneNumber, String mobPhoneNumber, String numberPassport, double countMooney) {
        this.firstName = firstName;
        this.middleName = middleName;
        this.lastName = lastName;
        this.dateOfBirthday = dateOfBirthday;
        this.city = city;
        this.street = street;
        this.homePhoneNumber = homePhoneNumber;
        this.mobPhoneNumber = mobPhoneNumber;
        this.numberPassport = numberPassport;
        this.countMooney = countMooney;
    }
    
    
    /**
     * @return the firstName
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * @param firstName the firstName to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * @return the middleName
     */
    public String getMiddleName() {
        return middleName;
    }

    /**
     * @param middleName the middleName to set
     */
    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    /**
     * @return the lastName
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * @param lastName the lastName to set
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * @return the dateOfBirthday
     */
    public Date getDateOfBirthday() {
        return dateOfBirthday;
    }

    /**
     * @param dateOfBirthday the dateOfBirthday to set
     */
    public void setDateOfBirthday(Date dateOfBirthday) {
        this.dateOfBirthday = dateOfBirthday;
    }

    public String getNumberPassport() {
        return numberPassport;
    }

    /**
     * @param numberPassport the numberPassport to set
     */
    public void setNumberPassport(String numberPassport) {
        this.numberPassport = numberPassport;
    }

    /**
     * @return the city
     */
    public String getCity() {
        return city;
    }

    /**
     * @param city the city to set
     */
    public void setCity(String city) {
        this.city = city;
    }

    /**
     * @return the street
     */
    public String getStreet() {
        return street;
    }

    /**
     * @param street the street to set
     */
    public void setStreet(String street) {
        this.street = street;
    }

    /**
     * @return the homePhoneNumber
     */
    public String getHomePhoneNumber() {
        return homePhoneNumber;
    }

    /**
     * @param homePhoneNumber the homePhoneNumber to set
     */
    public void setHomePhoneNumber(String homePhoneNumber) {
        this.homePhoneNumber = homePhoneNumber;
    }

    /**
     * @return the mobPhoneNumber
     */
    public String getMobPhoneNumber() {
        return mobPhoneNumber;
    }

    /**
     * @param mobPhoneNumber the mobPhoneNumber to set
     */
    public void setMobPhoneNumber(String mobPhoneNumber) {
        this.mobPhoneNumber = mobPhoneNumber;
    }

    /**
     * @return the countMooney
     */
    public double getCountMooney() {
        return countMooney;
    }

    /**
     * @param countMooney the countMooney to set
     */
    public void setCountMooney(double countMooney) {
        this.countMooney = countMooney;
    }

    /**
     * @return the block
     */
    public boolean isBlock() {
        return block;
    }

    /**
     * @param block the block to set
     */
    public void setBlock(boolean block) {
        this.block = block;
    }
    
    public void addService(Service service) {
        services.add(service);
    }
    
    public Service getService(int id) {
        return services.get(id);
    }

    /**
     * @return the dateRegistr
     */
    public Date getDateRegistr() {
        return dateRegistr;
    }

    /**
     * @param dateRegistr the dateRegistr to set
     */
    public void setDateRegistr(Date dateRegistr) {
        this.dateRegistr = dateRegistr;
    }
}
