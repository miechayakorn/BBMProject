package bbm.servlet;

import bbm.jpa.model.Account;
import bbm.jpa.model.controller.AccountJpaController;
import bbm.jpa.model.controller.exceptions.RollbackFailureException;
import bbm.model.EmailMessage;
import bbm.model.EncryptWithMd5;
import bbm.model.SendEmail;
import java.io.IOException;
import java.io.PrintWriter;
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

        if (activateKey == null && password == null && email != null) {
            String status = "notEmail";
            AccountJpaController accountJpaCtrl = new AccountJpaController(utx, emf);
            Account account = accountJpaCtrl.findAccount(email);

            if (account != null) {
                try {
                    String activateKeyInDB = account.getActivatekey();

                    //Send Email
                    String em = new EmailMessage(email, activateKeyInDB, "Recovery").getMessageSend();
                    int sendResult = SendEmail.send(email, em, "RecoveryPassword - BBMProject"); //SEND MAIL!
                    if (sendResult == 0) { //IS SENDING EMAIL successful?
                        accountJpaCtrl.edit(account);
                    }

                } catch (RollbackFailureException ex) {
                    Logger.getLogger(AccountRecoveryServlet.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(AccountRecoveryServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                status = "RecoveryTrue";
                request.setAttribute("status", status);
            } else {
                request.setAttribute("status", status);
            }

        } else if (email != null && activateKey != null && password == null) {
            AccountJpaController accountJpaCtrl = new AccountJpaController(utx, emf);
            Account account = accountJpaCtrl.findAccount(email);

            if (account != null) {
                if (account.getActivatekey().equals(activateKey)) {
                    request.setAttribute("email", email);
                    request.setAttribute("activateKey", activateKey);
                    request.getServletContext().getRequestDispatcher("/RecoveryChangePassword.jsp").forward(request, response);
                    return;
                } else {
                    request.setAttribute("status", "ActivateKeyError");
                    request.getServletContext().getRequestDispatcher("/RecoverySendEmail.jsp").forward(request, response);
                    return;
                }
            } else {
                request.setAttribute("status", "notEmail");
                request.getServletContext().getRequestDispatcher("/RecoverySendEmail.jsp").forward(request, response);
                return;
            }

        } else if (email != null && password != null && activateKey != null) {
            AccountJpaController accountJpaCtrl = new AccountJpaController(utx, emf);
            Account account = accountJpaCtrl.findAccount(email);
            String status = "notEmail";

            if (account != null) {
                if (account.getActivatekey().equals(activateKey)) {
                    try {
                        password = new EncryptWithMd5().encrypt(password);
                        account.setPassword(password);
                        account.setActivatekey(UUID.randomUUID().toString().replace("-", "").substring(0, 15));
                        account.setActivatedate(new Date());
                        accountJpaCtrl.edit(account);
                        status = "RecoveryTrue";

                    } catch (RollbackFailureException ex) {
                        Logger.getLogger(AccountRecoveryServlet.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (Exception ex) {
                        Logger.getLogger(AccountRecoveryServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                } else {
                    request.setAttribute("status", "ActivateKeyError");
                    request.getServletContext().getRequestDispatcher("/RecoverySendEmail.jsp").forward(request, response);
                    return;
                }
            } else {
                request.setAttribute("status", "notEmail");
                request.getServletContext().getRequestDispatcher("/RecoverySendEmail.jsp").forward(request, response);
                return;
            }

            request.setAttribute("status", status);
            request.getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }

        request.getServletContext().getRequestDispatcher("/RecoverySendEmail.jsp").forward(request, response);

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
