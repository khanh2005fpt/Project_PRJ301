/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.BitSet;
import java.util.Date;

import model.User;

/**
 *
 * @author Admin
 */
public class UserDao extends DBContext {

    public User getUser(String username) {
        User user = null;
        String sql = "select * from Admin where username = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                int userID = rs.getInt("userID");
                String email = rs.getString("email");
                String userna = rs.getString("username");
                String password = rs.getString("password");
                int admin = rs.getInt("admin");
                user = new User(name, userID, email, userna, password, admin);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return user;
    }

    public List<User> getAll() {
        List<User> list = new ArrayList<>();
        String sql = "select * from Admin";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                int userID = rs.getInt("userID");
                String email = rs.getString("email");
                String username = rs.getString("username");
                String password = rs.getString("password");
                int admin = rs.getInt("admin");
                User userlogin = new User(name, userID, email, username, password, admin);
                list.add(userlogin);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public boolean checkLogin(String user, String pass) {

        try {
            String sql = "select * from Admin where username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                if (rs.getString("username").equals(user)) {
                    if (rs.getString("password").equals(pass)) {
                        return true;
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;

    }

    public boolean checkRegister(String name, String email, String user) {

        try {
            String sql = "select * from Admin where username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                    if (rs.getString("email").equals(email)) {
                        if (rs.getString("username").equals(user)) {
                                return false;
                            
                        }
                    
                }

            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return true;

    }
    
    public void insert(String name, String email, String username, String password)
    {
        try {
             String sql = "insert into Admin\n" +
"	(name, email, username, password, admin) values\n" +
"	(?, ?, ?, ?, ?)";
        int admin = 0;
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, username);
        ps.setString(4, password);
        ps.setInt(5, admin);
        ps.execute();
        } catch (Exception e) {
            System.out.println(e);
        }  
    }
    
    public int count(String txt) throws SQLException{
        try {
            String sql = "select count (*) from Product where name like ?";
              PreparedStatement ps = connection.prepareStatement(sql);
              ps.setString(1,"%" + txt + "%");
              ResultSet rs = ps.executeQuery();
              while(rs.next())
              {
                  return rs.getInt(1); //cot dau tien
              }
        } catch (Exception e) {
        }
        return 0;
    }

    public static void main(String[] args) throws SQLException {
        UserDao ud = new UserDao();
        List<User> list = ud.getAll();
//        int count = ud.count("ga");
//        System.out.println(count);
        for (User student : list) {
            System.out.println(student.toString());
        }
    }
}
