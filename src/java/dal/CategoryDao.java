/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;

/**
 *
 * @author Admin
 */
public class CategoryDao extends DBContext{
    public List<Category> getAllCategory(){
        List<Category> list = new ArrayList<>();
        String sql = "select * from Category";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idcategory = rs.getInt("cid");
                String namecategory = rs.getString("cname");

                
               Category c = new Category(idcategory, namecategory);
               list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public static void main(String[] args) {
        CategoryDao ud = new CategoryDao();
        List<Category> list = ud.getAllCategory();
        for (Category student : list) {
            System.out.println(student.toString());
    }
}
}
