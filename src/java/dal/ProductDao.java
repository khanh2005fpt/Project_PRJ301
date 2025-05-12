/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class ProductDao extends DBContext{

    //ham lay tat ca san pham
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idproduct = rs.getInt("id");
                String nameproduct = rs.getString("name");
                String imageproduct = rs.getString("image");
                double priceproduct = rs.getDouble("price");
                String descriptionproduct = rs.getString("description");
                String cateid = rs.getString("cateid");
                int quantity = rs.getInt("quantity");
                Product product = new Product(idproduct, nameproduct, imageproduct, priceproduct, descriptionproduct, cateid, quantity);
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //ham tat ca san pham bang cateid
    public List<Product> getProductByCId(String cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where cateID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idproduct = rs.getInt("id");
                String nameproduct = rs.getString("name");
                String imageproduct = rs.getString("image");
                double priceproduct = rs.getDouble("price");
                String descriptionproduct = rs.getString("description");
                String cateid = rs.getString("cateid");
                int quantity = rs.getInt("quantity");
                Product product = new Product(idproduct, nameproduct, imageproduct, priceproduct, descriptionproduct, cateid, quantity);
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list; // Trả về null nếu không tìm thấy sản phẩm
    }

    //ham lay san pham bang id
    public Product getProductById(String id) {
        String sql = "select * from Product where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idproduct = rs.getInt("id");
                String nameproduct = rs.getString("name");
                String imageproduct = rs.getString("image");
                double priceproduct = rs.getDouble("price");
                String descriptionproduct = rs.getString("description");
                String cateid = rs.getString("cateid");
                int quantity = rs.getInt("quantity");
                Product product = new Product(idproduct, nameproduct, imageproduct, priceproduct, descriptionproduct, cateid, quantity);
                return product;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null; // Trả về null nếu không tìm thấy sản phẩm
    }
    
   

    //ham tim kiem ten san pham
    public int countPageBySearch(int dem, String txtSearch) {
    String sql = "SELECT COUNT(*) FROM Product WHERE name LIKE ?";
    int demPage = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                demPage = rs.getInt(1) / dem;
                if (rs.getInt(1) % dem != 0) {
                    demPage++;
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return demPage;
}

    
    public List<Product> searchByNamePagination(int begin, int count, String txtSearch) {
        String sql = "select * from Product where name like ? order by id offset ? rows fetch next ? rows only";
        List<Product> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
            ps.setInt(2, (begin - 1) * count);
            ps.setInt(3, count);    
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idproduct = rs.getInt("id");
                String nameproduct = rs.getString("name");
                String imageproduct = rs.getString("image");
                double priceproduct = rs.getDouble("price");
                String descriptionproduct = rs.getString("description");
                String cateid = rs.getString("cateid");
                int quantity = rs.getInt("quantity");
                Product product = new Product(idproduct, nameproduct, imageproduct, priceproduct, descriptionproduct, cateid, quantity);
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list; // Trả về null nếu không tìm thấy sản phẩm
    }

    //ham dem so trang
    public int countPage(int dem) {
        String sql = "select count(*) from Product a join Category b on a.cateid = b.cid";
        int demPage = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                demPage = rs.getInt(1) / dem;
                if (rs.getInt(1) % dem != 0) {
                    demPage++;
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return demPage;
    }

    //ham lay san pham trong 1 trang
    public List<Product> getProductPagination(int begin, int count) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product a join Category b on a.cateid = b.cid order by id offset ? rows fetch next ? rows only";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (begin - 1) * count);
            ps.setInt(2, count);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idproduct = rs.getInt("id");
                String nameproduct = rs.getString("name");
                String imageproduct = rs.getString("image");
                double priceproduct = rs.getDouble("price");
                String descriptionproduct = rs.getString("description");
                String cateid = rs.getString("cateid");
                int quantity = rs.getInt("quantity");
                Product product = new Product(idproduct, nameproduct, imageproduct, priceproduct, descriptionproduct, cateid, quantity);
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list; // Trả về null nếu không tìm thấy sản phẩm
    }

   
    
     public int countPageByID(int dem, String id) {
        String sql = "select count(*) from Product a join Category b on a.cateid = b.cid where b.cid = ?";
        int demPage = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
             ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                
                    demPage = rs.getInt(1) / dem;
                if (rs.getInt(1) % dem != 0) {
                    demPage++;
                }
                
         
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return demPage;
    }
     
      public List<Product> getProductPaginationByID(int begin, int count, String cateID) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product a join Category b on a.cateid = b.cid where b.cid = ? order by id offset ? rows fetch next ? rows only";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cateID);
            ps.setInt(2, (begin - 1) * count);
            ps.setInt(3, count);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idproduct = rs.getInt("id");
                String nameproduct = rs.getString("name");
                String imageproduct = rs.getString("image");
                double priceproduct = rs.getDouble("price");
                String descriptionproduct = rs.getString("description");
                String cateid = rs.getString("cateid");
                int quantity = rs.getInt("quantity");
                Product product = new Product(idproduct, nameproduct, imageproduct, priceproduct, descriptionproduct, cateid, quantity);
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list; // Trả về null nếu không tìm thấy sản phẩm
    }
    
    //ham lay danh sach san pham theo id san pham nguoi mua hoac ban
    public List<Product> getProductBySellID(int id) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where sellid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idproduct = rs.getInt("id");
                String nameproduct = rs.getString("name");
                String imageproduct = rs.getString("image");
                double priceproduct = rs.getDouble("price");
                String descriptionproduct = rs.getString("description");
                String cateid = rs.getString("cateid");
                int quantity = rs.getInt("quantity");
                Product product = new Product(idproduct, nameproduct, imageproduct, priceproduct, descriptionproduct, cateid, quantity);
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list; // Trả về null nếu không tìm thấy sản phẩm
    }
    
    public List<Product> searchProducts(String keyword, int page, int pageSize) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Products WHERE name LIKE ? OR category LIKE ? LIMIT ? OFFSET ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");
            ps.setInt(3, pageSize);
            ps.setInt(4, (page - 1) * pageSize);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idproduct = rs.getInt("id");
                String nameproduct = rs.getString("name");
                String imageproduct = rs.getString("image");
                double priceproduct = rs.getDouble("price");
                String descriptionproduct = rs.getString("description");
                String cateid = rs.getString("cateid");
                int quantity = rs.getInt("quantity");
                Product product = new Product(idproduct, nameproduct, imageproduct, priceproduct, descriptionproduct, cateid, quantity);
                list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int countSearchResults(String keyword) {
        String sql = "SELECT COUNT(*) FROM Products WHERE name LIKE ? OR category LIKE ?";
        try{
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    public void delete(String pid) {
        String sql = "delete from product where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void insert(String addname, String addimage, String addprice, String adddescription, String addcateid, int addsellid) {
        String sql = "insert Product (name, image, price, description, cateid, sellid) values (?, ?, ?, ?, ?, ?) ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setString(1, addid);
            ps.setString(1, addname);
            ps.setString(2, addimage);
            ps.setString(3, addprice);
            ps.setString(4, adddescription);
            ps.setString(5, addcateid);
            ps.setInt(6, addsellid);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
     public void update(String updatename, String updateimage, String updateprice, String updatedescription, String updatecateid, String pid) {
        String sql = "update Product set name = ?, image = ?, price = ?, description = ?, cateid = ? where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setString(1, addid);
            ps.setString(1, updatename);
            ps.setString(2, updateimage);
            ps.setString(3, updateprice);
            ps.setString(4, updatedescription);
            ps.setString(5, updatecateid);
            ps.setString(6, pid);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

     
    public static void main(String[] args) {
        ProductDao pd = new ProductDao();
        pd.update("Nước ngọt Pepsi không calo lon 330ml", "cc", "10", "blabla", "4", "15");

// Kiểm tra lại bằng SELECT
        Product p = pd.getProductById("15");
        if (p != null) {
            System.out.println("Insert thành công: " + p.toString());
        } else {
            System.out.println("Insert thất bại hoặc ID không tồn tại.");
        }

//        System.out.println(list.toString());
//        List<Product> list = ud.getAllProduct();
//        List<Product> listP = ud.getProductByCId("4");
//        Product p = ud.getProductById("1");
//        System.out.println(p.toString());
//          System.out.println(listP);
//          System.out.println(p.getName());
//        int count = ud.count("ga");
//        System.out.println(count);
//        for (Product student : list) {
//            System.out.println(student.toString());
//   System.out.println(student.getName());
    }
}
