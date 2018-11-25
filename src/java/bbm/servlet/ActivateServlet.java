package bbm.servlet;

import bbm.jpa.model.Account;
import bbm.jpa.model.controller.AccountJpaController;
import bbm.jpa.model.controller.exceptions.RollbackFailureException;
import java.io.IOException;
import java.util.Date;
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

public class ActivateServlet extends HttpServlet {

    @Resource
    UserTransaction utx;
    @PersistenceUnit(unitName = "BBMWebAppPU")
    EntityManagerFactory emf;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String activateKey = request.getParameter("activateKey");

        if (email != null && email.length() > 0 && activateKey != null && activateKey.length() > 0) {
            AccountJpaController accountJpaCtrl = new AccountJpaController(utx, emf);
            Account account = accountJpaCtrl.findAccount(email);

            if (account != null) {
                String statusActivate = "ActivateFalse";
                if (activateKey.equals(account.getActivatekey()) && email.equals(account.getEmail())) {
                    account.setActivatedate(new Date());
                    account.setActivatekey(UUID.randomUUID().toString().replace("-", "").substring(0, 15));
                    try {
                        accountJpaCtrl.edit(account);
                        statusActivate = "ActivateTrue";
                        request.setAttribute("status", statusActivate);
                        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
                        return;
                    } catch (RollbackFailureException ex) {
                        Logger.getLogger(ActivateServlet.class.getName()).log(Level.SEVERE, "jpa", ex);
                    } catch (Exception ex) {
                        Logger.getLogger(ActivateServlet.class.getName()).log(Level.SEVERE, "jpa", ex);
                    }
                } else {
                    request.setAttribute("status", statusActivate);
                    getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
                    return;
                }
            } else {
                request.setAttribute("status", "notEmail");
                getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
                return;
            }
        }
        response.sendRedirect("/BBMProject");
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
