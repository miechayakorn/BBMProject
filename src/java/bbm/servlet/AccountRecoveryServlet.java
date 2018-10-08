package bbm.servlet;

import bbm.jpa.model.MemberCustomer;
import bbm.jpa.model.controller.MemberCustomerJpaController;
import bbm.jpa.model.controller.exceptions.RollbackFailureException;
import bbm.model.EncryptWithMd5;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;
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

public class AccountRecoveryServlet extends HttpServlet {

    @Resource
    UserTransaction utx;
    @PersistenceUnit(unitName = "BBMWebAppPU")
    EntityManagerFactory emf;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String activateKey = request.getParameter("activateKey");
        String password = request.getParameter("password");

        if (activateKey == null && password == null) {
            if (email != null && email.trim().length() > 0) {
                boolean status = false;
                MemberCustomerJpaController memberJPA = new MemberCustomerJpaController(utx, emf);
                MemberCustomer member = memberJPA.findMemberCustomer(email);

                if (member != null) {
                    try {
                        member.setActivatekey(UUID.randomUUID().toString().replace("-", "").substring(0, 15));
                        memberJPA.edit(member);
                    } catch (RollbackFailureException ex) {
                        Logger.getLogger(AccountRecoveryServlet.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (Exception ex) {
                        Logger.getLogger(AccountRecoveryServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    status = true;
                    request.setAttribute("status", status);
                } else {
                    request.setAttribute("status", status);
                }
            }
            request.getServletContext().getRequestDispatcher("/RecoverySendEmail.jsp").forward(request, response);
            return;
            
        } else if (email != null && activateKey != null && password == null) {
            request.setAttribute("email", email);
            request.setAttribute("activateKey", activateKey);
            request.getServletContext().getRequestDispatcher("/RecoveryChangePassword.jsp").forward(request, response);
            return;
        } else if (email != null && password != null && activateKey != null) {
            MemberCustomerJpaController memberJPA = new MemberCustomerJpaController(utx, emf);
            MemberCustomer member = memberJPA.findMemberCustomer(email);
            boolean status = false;
            
            if (member != null) {
                try {
                    password = new EncryptWithMd5().encrypt(password);
                    member.setPassword(password);
                    memberJPA.edit(member);
                    status = true;
                    
                } catch (RollbackFailureException ex) {
                    Logger.getLogger(AccountRecoveryServlet.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(AccountRecoveryServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            request.setAttribute("status", status);
            request.getServletContext().getRequestDispatcher("/RecoveryChangePassword.jsp").forward(request, response);
            return;
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
