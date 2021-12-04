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
                products.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
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
}
