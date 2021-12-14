/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import static dal.DBContext.connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Sale;

/**
 *
 * @author Hung
 */
public class SaleDAO {
    public ArrayList<Sale> getAllSales()
    {
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        ArrayList<Sale> sales = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Sale] where ? between startDate and endDate";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(1, date);
            ResultSet rs = stm.executeQuery();
            while(rs.next())
            {
                Sale d = new Sale();
                d.setProduct(rs.getString("product"));
                d.setPercentage(rs.getInt("percentage"));
                d.setStartDate(rs.getDate("startDate"));
                d.setEndDate(rs.getDate("endDate"));
                
                sales.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SaleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sales;
    }
    public ArrayList<Sale> getHighestSales()
    {
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        ArrayList<Sale> sales = new ArrayList<>();
        try {
            String sql = "SELECT top 3 * FROM Sale  where ? between startDate and endDate";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(1, date);
            ResultSet rs = stm.executeQuery();
            while(rs.next())
            {
                Sale d = new Sale();
                d.setProduct(rs.getString("product"));
                d.setPercentage(rs.getInt("percentage"));
                d.setStartDate(rs.getDate("startDate"));
                d.setEndDate(rs.getDate("endDate"));
                
                sales.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SaleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sales;
    }
    
}
