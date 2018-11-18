/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bbm.servlet;

import bbm.jpa.model.Account;
import bbm.jpa.model.Customer;
import bbm.jpa.model.controller.AccountJpaController;
import bbm.jpa.model.controller.CustomerJpaController;
import bbm.model.EncryptWithMd5;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 *
 * @author Acer_E5
 */
public class LoginServlet extends HttpServlet {

    @Resource
    UserTransaction utx;

    @PersistenceUnit(unitName = "BBMWebAppPU")
    EntityManagerFactory emf;

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

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        HttpSession session = request.getSession(false);

        if (email != null && password != null && email.length() > 0 && password.length() > 0) {
            AccountJpaController accountJpaCtrl = new AccountJpaController(utx, emf);
            Account account = accountJpaCtrl.findAccount(email);
            password = new EncryptWithMd5().encrypt(password);
            if (account != null) {
                if (account.getPassword().equals(password)) {

                    if (session == null) {
                        session = request.getSession(true);
                    }

                    CustomerJpaController customerJpaCtrl = new CustomerJpaController(utx, emf);
                    Customer customer = customerJpaCtrl.findByEmail(email);
                    if (customer != null) {
                        session.setAttribute("customer", customer);
                        if (session.getAttribute("cart") != null) {
                            response.sendRedirect("ShowCart");
                            return;
                        }
                        response.sendRedirect("/BBMProject");
                        return;
                    } else {
                        getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
                        return;
                    }
                } else {
                    request.setAttribute("message", "Invalid username or password !!");
                }
            } else {
                request.setAttribute("message", "Invalid username or password !!");
            }
        }
        getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);

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
        processRequest(request, response);
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
        processRequest(request, response);
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
