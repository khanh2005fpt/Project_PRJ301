/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class User {
    private String name;
    private int userID;
    private String email;
    private String username;
    private String password;
    private int admin;

    public User(String name, int userID, String email, String username, String password, int admin) {
        this.name = name;
        this.userID = userID;
        this.email = email;
        this.username = username;
        this.password = password;
        this.admin = admin;
    }

    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getAdmin() {
        return admin;
    }

    public void setAdmin(int admin) {
        this.admin = admin;
    }



    @Override
    public String toString() {
        return "User{" + "name=" + name + ", userID=" + userID + ", email=" + email + ", username=" + username + ", password=" + password + ", admin=" + admin + '}';
    }

   
    
    
}
