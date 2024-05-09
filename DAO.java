/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.*;
import Models.*;

/**
 *
 * @author ADMIN
 */
public class DAO {
    private Connection con;
    private String status = "ok";

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    //load tat ca san pham o database len jsp
    public List<Product> loadAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product";
        try {
            con = new DBContext().connection;
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int pid = rs.getInt(1);
                String name = rs.getString(2);
                String image = rs.getString(3);
                double price = rs.getDouble(4);
                String description = rs.getString(5);
                list.add(new Product(pid, name, image, price, description));
            }
        } catch (Exception e) {
            status = "Error at load Category" + e.getMessage();
        }
        return list;
    }

    //load tat ca cac danh muc san pham o database len jsp
    public List<Category> loadAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Category";
        try {
            con = new DBContext().connection;
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int cid = rs.getInt(1);
                String cname = rs.getString(2);
                String cimg = rs.getString(3);
                list.add(new Category(cid, cname, cimg));
            }
        } catch (Exception e) {
            status = "Error at load Category" + e.getMessage();
        }
        return list;
    }

    //tra ve san pham gia cao nhat trong database
    public Product getFirst() {
        String sql = "select top 1 * from Product\n"
                + "order by pprice desc";
        try {
            con = new DBContext().connection;
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5));

            }
        } catch (Exception e) {
            status = "Error at get product by max price" + e.getMessage();
        }
        return null;
    }

    //load cac san pham theo danh muc cua moi sp
    public List<Product> loadAllProductByCategory(String cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product\n"
                + "where cid= ?";
        try {
            con = new DBContext().connection;
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ps.setString(1, cid);
            while (rs.next()) {
                int pid = rs.getInt(1);
                String name = rs.getString(2);
                String image = rs.getString(3);
                double price = rs.getDouble(4);
                String description = rs.getString(5);
                list.add(new Product(pid, name, image, price, description));
            }
        } catch (Exception e) {
            status = "Error at load Product by Category" + e.getMessage();
        }
        return list;
    }

    //search san pham theo ten cua chung
    public List<Product> loadAllProductBySearch(String searchtxt) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product\n"
                + "where pname like ?";
        try {
            con = new DBContext().connection;
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ps.setString(1, "%" + searchtxt + "%");
            while (rs.next()) {
                int pid = rs.getInt(1);
                String name = rs.getString(2);
                String image = rs.getString(3);
                double price = rs.getDouble(4);
                String description = rs.getString(5);
                list.add(new Product(pid, name, image, price, description));
            }
        } catch (Exception e) {
            status = "Error at load Product when searched" + e.getMessage();
        }
        return list;
    }

    //load thong tin cua tung san pham theo id cua chung
    public Product loadProductById(String pid) {
        String sql = "select * from Product\n"
                + "where pid=?";
        try {
            con = new DBContext().connection;
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ps.setString(1, pid);
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5));
            }
        } catch (Exception e) {
            status = "Error at load Product by id" + e.getMessage();
        }
        return null;
    }

    //kiem tra xem account cua 1 nguoi co o trong database khong de thuc hien thao tac login
    public Account verifyLogin(String username, String password) {
        String sql = "select * from account\n"
                + "where username=?\n"
                + "and pass= ?";
        try {
            con = new DBContext().connection;
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ps.setString(1, username);
            ps.setString(2, password);
            while (rs.next()) {
                return new Account(rs.getString(1), rs.getString(2), rs.getInt(3));
            }
        } catch (Exception e) {
            status = "Error when verify login" + e.getMessage();
        }
        return null;
    }

    //kiem tra xem trong database da co account nay chua
    public Account checkAccExist(String username) {
        String sql = "select * from account\n"
                + "where username=?\n";
        try {
            con = new DBContext().connection;
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ps.setString(1, username);
            while (rs.next()) {
                return new Account(rs.getString(1), rs.getString(2), rs.getInt(3));
            }
        } catch (Exception e) {
            status = "Error when check acc if it exist" + e.getMessage();
        }
        return null;
    }

    //them 1 nguoi dang ky moi vao database
    public void accSignUp(String username, String password) {
        String sql = "insert into account\n"
                + "values(?,?,0)";
        try {
            con = new DBContext().connection;
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.execute();
        } catch (Exception e) {
            status = "Error at signup" + e.getMessage();
        }
    }

    //tao ra san pham moi len database
    public void insert(int pid, String name, String image, double price, String description, int cid) {
        String sql = "INSERT INTO [dbo].[Product]\n"
                + "           ([pid],[pname],[pimage],[pprice],[description],[cid])\n"
                + "           VALUES (?,?,?,?,?,?)";
        try {
            con = new DBContext().connection;
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, pid);
            ps.setString(2, name);
            ps.setString(3, image);
            ps.setDouble(4, price);
            ps.setString(5, description);
            ps.setInt(6, cid);
            ps.execute();
        } catch (Exception e) {
            status = "Error at inserting product:" + e.getMessage();

        }
    }

    //cap nhat san pham o database
    public void update(int pid, String name, String image, double price, String description, int cid) {
        String sql = "UPDATE Product SET [pid] = ? \n, [pname] = ? \n"
                + ",[pimage] = ? \n,[pprice] = ? \n"
                + ",[description] = ? \n,[cid] = ? \n"
                + "WHERE [pid]= ? ";
        try {
            con = new DBContext().connection;
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, pid);
            ps.setString(2, name);
            ps.setString(3, image);
            ps.setDouble(4, price);
            ps.setString(5, description);
            ps.setInt(6, cid);
            ps.setInt(7, pid);
            ps.execute();

        } catch (Exception e) {
            status = "Error at update Product:" + e.getMessage();
        }
    }

    //xoa san pham o database
    public void delete(String pid) {
        String sql = " delete from product where pid =?";
        try {
            con = new DBContext().connection;
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, pid);
            ps.execute();
        } catch (Exception e) {
            status = "ERROR at delete Product" + e.getMessage();
        }
    }

    public static void main(String[] args) {
        DAO d = new DAO();
        d.update(20, "ass", "as", 77, "as", 3);
        System.out.println("");
    }
}
