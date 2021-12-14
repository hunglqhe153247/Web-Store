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
                d.setPrice(rs.getInt("price"));
                d.setUnit(rs.getString("unit"));
                d.setCategory(rs.getString("category"));
                d.setImagie(rs.getString("imagie"));
                d.setDescription(rs.getString("description"));
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
                d.setPrice(rs.getInt("price"));
                d.setUnit(rs.getString("unit"));
                d.setCategory(rs.getString("category"));
                d.setImagie(rs.getString("imagie"));
                d.setDescription(rs.getString("description"));
                
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
                d.setPrice(rs.getInt("price"));
                d.setUnit(rs.getString("unit"));
                d.setCategory(rs.getString("category"));
                d.setImagie(rs.getString("imagie"));
                d.setDescription(rs.getString("description"));
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
                d.setPrice(rs.getInt("price"));
                d.setUnit(rs.getString("unit"));
                d.setCategory(rs.getString("category"));
                d.setImagie(rs.getString("imagie"));
                d.setDescription(rs.getString("description"));
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
                d.setPrice(rs.getInt("price"));
                d.setUnit(rs.getString("unit"));
                d.setCategory(rs.getString("category"));
                d.setImagie(rs.getString("imagie"));
                d.setDescription(rs.getString("description"));
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
}
