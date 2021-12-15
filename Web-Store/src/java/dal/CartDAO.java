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
import model.Cart;

/**
 *
 * @author Hung
 */
public class CartDAO extends DBContext{
    public static void insertProduct (Cart c) {
        try {
            String sql = "INSERT INTO [Cart] VALUES (?, ?, ?);";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, c.getProduct());
            statement.setInt(2, c.getQuantity());
            statement.setString(3, c.getCustomer());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static void updateProduct (Cart c) {
        try {
            String sql = "UPDATE cart SET quantity= ? WHERE product= ? and customer= ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, c.getQuantity());
            statement.setString(2, c.getProduct());
            statement.setString(3, c.getCustomer());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public ArrayList<Cart> getCart(String email)
    {
        ArrayList<Cart> acc = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Cart where customer = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            while(rs.next())
            {
                Cart d = new Cart();
                d.setProduct(rs.getString("product"));
                d.setQuantity(rs.getInt("quantity"));
                d.setCustomer(rs.getString("customer"));
                
                acc.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return acc;
    }
    public ArrayList<Cart> getAllCart()
    {
        ArrayList<Cart> acc = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Cart";
            PreparedStatement stm = connection.prepareStatement(sql);
            
            ResultSet rs = stm.executeQuery();
            while(rs.next())
            {
                Cart d = new Cart();
                d.setProduct(rs.getString("product"));
                d.setQuantity(rs.getInt("quantity"));
                d.setCustomer(rs.getString("customer"));
                
                acc.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return acc;
    }
    public static void deleteProduct (String product, String customer) {
        try {
            String sql = "DELETE FROM cart WHERE product=? and customer=?;";
            PreparedStatement statement = connection.prepareStatement(sql);
            
            statement.setString(1, product);
            statement.setString(2, customer);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
