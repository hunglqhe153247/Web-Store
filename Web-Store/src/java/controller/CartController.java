/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.CartDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Cart;

/**
 *
 * @author Hung
 */
public class CartController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CartController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String quantity = request.getParameter("quantity");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String customer = account.getEmail();
        CartDAO dao = new CartDAO();
        boolean addnew = true;
        ArrayList<Cart> allcart = dao.getAllCart();
        for(Cart c : allcart){
            if(c.getProduct().equals(id)&&c.getCustomer().equals(customer)){
                Cart cartupdate = new Cart(id, c.getQuantity()+Integer.parseInt(quantity), customer);
                dao.updateProduct(cartupdate);
                addnew=false;
            }
        }
        if(addnew==true){
        Cart cartnew = new Cart(id, Integer.parseInt(quantity), customer);
        dao.insertProduct(cartnew);
        }
        ArrayList<Cart> cart = dao.getCart(customer);
        session.setAttribute("cart", cart);
        
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String quantity = request.getParameter("quantity");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        String customer = account.getEmail();
        CartDAO dao = new CartDAO();
        
        ArrayList<Cart> allcart = dao.getAllCart();
        for(Cart c : allcart){
            if(c.getProduct().equals(id)&&c.getCustomer().equals(customer)){
                Cart cartupdate = new Cart(id, Integer.parseInt(quantity), customer);
                dao.updateProduct(cartupdate);
                
            }
        }
        
        ArrayList<Cart> cart = dao.getCart(customer);
        session.setAttribute("cart", cart);
        
        request.getRequestDispatcher("shopping-cart.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
