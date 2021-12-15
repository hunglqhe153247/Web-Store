/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author Hung
 */
public class login extends HttpServlet {

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
            out.println("<title>Servlet login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet login at " + request.getContextPath() + "</h1>");
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
        Cookie[] cookies = request.getCookies();
        AccountDAO db = new AccountDAO();
        if (cookies != null) {
            for (Cookie cooky : cookies) {
                if (cooky.getName().equals("email")) {
                    Account account = db.getAccount(cooky.getValue());
                    if (account != null) {
                        HttpSession session = request.getSession();
                        session.setAttribute("account", account);
                        request.getRequestDispatcher("home.jsp").forward(request, response);
                    }
                }
            }

        }

        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        AccountDAO dao = new AccountDAO();
        ArrayList<Account> acc = dao.getAllAccounts();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean accept = false;
        PrintWriter out = response.getWriter();
        for (Account a : acc) {
            if (a.getEmail().equals(email) && a.getPassword().equals(password)) {
                String remember = request.getParameter("remember");
                if (remember != null) {
                    Cookie c_user = new Cookie("email", email);
                    Cookie c_pass = new Cookie("password", password);
                    c_user.setMaxAge(3600 * 24 * 30);
                    c_pass.setMaxAge(3600 * 24 * 30);
                    response.addCookie(c_pass);
                    response.addCookie(c_user);
                }

                HttpSession session = request.getSession();
                session.setAttribute("account", a);
                request.getRequestDispatcher("/ProductController").forward(request, response);
                accept = true;
            }
        }
        if (accept == false) {

            out.println("<script type=\"text/javascript\">");
            out.println("alert('Email or password incorrect');");
            out.println("location='login.jsp';");
            out.println("</script>");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
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
