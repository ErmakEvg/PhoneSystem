/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package by.phone.system.model;

/**
 *
 * @author user
 */
public class User extends Entity {

    private String login;
    private String password;

    public User() {
    }

    public User( String login, String password) {
        this.login = login;
        this.password = password;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    @Override
    public String toString() {
        return super.toString();
    }
    
    
}
