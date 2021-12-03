/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author Surface book 2
 */
public class AccountDAO extends DBContext {
    public ArrayList<Account> getAllAccounts()
    {
        ArrayList<Account> acc = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Account";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next())
            {
                Account d = new Account();
                d.setEmail(rs.getString("email"));
                d.setName(rs.getString("name"));
                d.setPhone(rs.getString("phone"));
                d.setPassword(rs.getString("password"));
                d.setAddress(rs.getString("address"));
                acc.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return acc;
    }
}
