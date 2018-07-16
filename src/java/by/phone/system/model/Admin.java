/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package by.phone.system.model;

/**
 *
 * @author user
 */
public class Admin extends User {
    private String firtsName;
    private String middleName;
    private String lastName;

    public Admin() {
    }

    public Admin(String firtsName, String middleName, String lastName) {
        this.firtsName = firtsName;
        this.middleName = middleName;
        this.lastName = lastName;
    }

    public String getFirtsName() {
        return firtsName;
    }

    public void setFirtsName(String firtsName) {
        this.firtsName = firtsName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }
}
