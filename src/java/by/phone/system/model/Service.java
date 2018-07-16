/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package by.phone.system.model;

/**
 *
 * @author user
 */
public class Service extends Entity 
{
    
    private String name;
    private String description;
    private double price;
    

    public Service() {
    }

    public Service(int id, String name, String description, double price) {
        this.name = name;
        this.description = description;
        this.price = price;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the price
     */
    public double getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(double price) {
        this.price = price;
    }
    
    
}
