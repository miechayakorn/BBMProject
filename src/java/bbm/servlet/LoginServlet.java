package bbm.servlet;

import bbm.jpa.model.Account;
import bbm.jpa.model.Customer;
import bbm.jpa.model.controller.AccountJpaController;
import bbm.jpa.model.controller.CustomerJpaController;
import bbm.model.EncryptWithMd5;
import java.io.IOException;
import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

public class LoginServlet extends HttpServlet {

    @Resource
    UserTransaction utx;

    @PersistenceUnit(unitName = "BBMWebAppPU")
    EntityManagerFactory emf;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        HttpSession session = request.getSession(false);

        if (session == null) {
            session = request.getSession(true);
        }
        if (session.getAttribute("customer") != null) {
            response.sendRedirect("/BBMProject");
            return;
        }
        if (email != null && password != null && email.length() > 0 && password.length() > 0) {
            CustomerJpaController customerJpaCtrl = new CustomerJpaController(utx, emf);
            Customer customer = customerJpaCtrl.findByEmail(email);
            password = new EncryptWithMd5().encrypt(password);
            if (customer != null) {
                if (customer.getEmail().getPassword().equals(password)) {

                    session.setAttribute("customer", customer);
                    if (session.getAttribute("cart") != null) {
                        response.sendRedirect("ShowCart");
                        return;
                    }
                    response.sendRedirect("/BBMProject");
                    return;

                } else {
                    request.setAttribute("message", "Invalid");
                }
            } else {
                request.setAttribute("message", "Invalid");
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
