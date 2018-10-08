/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bbm.servlet;

import bbm.jpa.model.MemberCustomer;
import bbm.jpa.model.controller.MemberCustomerJpaController;
import bbm.jpa.model.controller.exceptions.RollbackFailureException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;

/**
 *
 * @author Acer_E5
 */
public class ActivateServlet extends HttpServlet {

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
        String activateKey = request.getParameter("activateKey");
        boolean isActivate = false;

        if (email != null && email.length() > 0 && activateKey != null && activateKey.length() > 0) {
            MemberCustomerJpaController memberJPA = new MemberCustomerJpaController(utx, emf);
            MemberCustomer member = memberJPA.findMemberCustomer(email);
            try {
                if (activateKey.equals(member.getActivatekey())) {
                    member.setActivatedate(new Date());
                    try {
                        memberJPA.edit(member);
                        isActivate = true;

                    } catch (RollbackFailureException ex) {
                        Logger.getLogger(ActivateServlet.class.getName()).log(Level.SEVERE, "jpa", ex);
                    } catch (Exception ex) {
                        Logger.getLogger(ActivateServlet.class.getName()).log(Level.SEVERE, "jpa", ex);
                    }
                }
            } catch (Exception ex) {
                request.setAttribute("isActivate", isActivate);
                getServletContext().getRequestDispatcher("/RegisterMessage.jsp").forward(request, response);
                return;
            }
            request.setAttribute("email", email);
            request.setAttribute("isActivate", isActivate);
        }
        getServletContext().getRequestDispatcher("/RegisterMessage.jsp").forward(request, response);
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
