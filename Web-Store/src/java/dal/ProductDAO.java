/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import static dal.DBContext.connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Category;

import model.Product;
import model.Review;

/**
 *
 * @author Hung
 */
public class ProductDAO extends DBContext{
    public ArrayList<Product> getAllProducts()
    {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Product]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next())
            {
                Product d = new Product();
                d.setId(rs.getString("id"));
                d.setName(rs.getString("name"));
                d.setPrice(rs.getFloat("price"));
                d.setUnit(rs.getString("unit"));
                d.setCategory(rs.getString("category"));
                d.setImagie(rs.getString("imagie"));
                d.setDescription(rs.getString("description"));
                d.setSupplier(rs.getString("supplier"));
                products.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
    public ArrayList<Product> searchProduct(String search)
    {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Product] where name like '"+"%"+search+"%'";
            PreparedStatement stm = connection.prepareStatement(sql);
            
            ResultSet rs = stm.executeQuery();
            while(rs.next())
            {
                Product d = new Product();
                d.setId(rs.getString("id"));
                d.setName(rs.getString("name"));
                d.setPrice(rs.getFloat("price"));
                d.setUnit(rs.getString("unit"));
                d.setCategory(rs.getString("category"));
                d.setImagie(rs.getString("imagie"));
                d.setDescription(rs.getString("description"));
                d.setSupplier(rs.getString("supplier"));
                products.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
    public Product getProducts(String id)
    {
        Product d = new Product();
        try {
            String sql = "SELECT * FROM [Product] where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            
            while(rs.next())
            {
                
                d.setId(rs.getString("id"));
                d.setName(rs.getString("name"));
                d.setPrice(rs.getFloat("price"));
                d.setUnit(rs.getString("unit"));
                d.setCategory(rs.getString("category"));
                d.setImagie(rs.getString("imagie"));
                d.setDescription(rs.getString("description"));
                d.setSupplier(rs.getString("supplier"));
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return d;
    }
    public Category getCategory(String id)
    {
        Category d = new Category();
        try {
            String sql = "SELECT * FROM [Categories] where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            
            while(rs.next())
            {
                
                d.setId(rs.getString("id"));
                d.setName(rs.getString("name"));
                
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return d;
    }
    public ArrayList<Category> getAllCategories()
    {
        ArrayList<Category> categories = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Categories]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next())
            {
                Category d = new Category();
                d.setId(rs.getString("id"));
                d.setName(rs.getString("name"));
                
                categories.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return categories;
    }
    public ArrayList<Product> getNewProducts(String Category)
    {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT TOP 10 * FROM [Product] where category= ? ORDER BY id DESC";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, Category);
            ResultSet rs = stm.executeQuery();
            
            while(rs.next())
            {
                Product d = new Product();
                d.setId(rs.getString("id"));
                d.setName(rs.getString("name"));
                d.setPrice(rs.getFloat("price"));
                d.setUnit(rs.getString("unit"));
                d.setCategory(rs.getString("category"));
                d.setImagie(rs.getString("imagie"));
                d.setDescription(rs.getString("description"));
                d.setSupplier(rs.getString("supplier"));
                products.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
    public ArrayList<Product> getNewProducts()
    {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT TOP 10 * FROM [Product] ORDER BY id DESC";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next())
            {
                Product d = new Product();
                d.setId(rs.getString("id"));
                d.setName(rs.getString("name"));
                d.setPrice(rs.getFloat("price"));
                d.setUnit(rs.getString("unit"));
                d.setCategory(rs.getString("category"));
                d.setImagie(rs.getString("imagie"));
                d.setDescription(rs.getString("description"));
                d.setSupplier(rs.getString("supplier"));
                products.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
    public ArrayList<Product> getProductsWithCategory(String category)
    {
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Product] where category = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, category);
            ResultSet rs = stm.executeQuery();
            while(rs.next())
            {
                Product d = new Product();
                d.setId(rs.getString("id"));
                d.setName(rs.getString("name"));
                d.setPrice(rs.getFloat("price"));
                d.setUnit(rs.getString("unit"));
                d.setCategory(rs.getString("category"));
                d.setImagie(rs.getString("imagie"));
                d.setDescription(rs.getString("description"));
                d.setSupplier(rs.getString("supplier"));
                products.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
    public ArrayList<Review> getReview(String Category)
    {
        ArrayList<Review> products = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Review] where category= ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, Category);
            ResultSet rs = stm.executeQuery();
            
            while(rs.next())
            {
                Review d = new Review();
                d.setId(rs.getString("id"));
                d.setWriter(rs.getString("writer"));
                d.setCategory(rs.getString("category"));
                d.setImagie(rs.getString("imagie"));
                d.setContent(rs.getString("content"));
                
                products.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
    public static void insertProduct(Product s) {
        try {
            String sql = "INSERT INTO Product VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, s.getId());
            statement.setString(2, s.getName());
            statement.setFloat(3, s.getPrice());
            statement.setString(4, s.getUnit());
            statement.setString(5, s.getCategory());
            statement.setString(6, s.getImagie());
            statement.setString(7, s.getDescription());
            statement.setString(8, s.getSupplier());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static void deleteProduct (String id) {
        try {
            String sql = "DELETE FROM Product WHERE id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            
            statement.setString(1, id);
            
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
