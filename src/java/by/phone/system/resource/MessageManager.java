/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package by.phone.system.resource;

import java.util.ResourceBundle;

/**
 *
 * @author user
 */
public class MessageManager {
    
    private final static ResourceBundle resourceBundle= ResourceBundle.getBundle("by.phone.system.properties.messages");
    
    private MessageManager() { }
    
    public static String getProperty(String key) {
        return resourceBundle.getString(key);
    }
}