package bbm.servlet;

import bbm.jpa.model.Account;
import bbm.jpa.model.Customer;
import bbm.jpa.model.controller.AccountJpaController;
import bbm.jpa.model.controller.CustomerJpaController;
import bbm.jpa.model.controller.exceptions.RollbackFailureException;
import bbm.model.EmailMessage;
import bbm.model.EncryptWithMd5;
import bbm.model.SendEmail;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;
import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;

public class RegisterServlet extends HttpServlet {

    @Resource
    UserTransaction utx;
    @PersistenceUnit(unitName = "BBMWebAppPU")
    EntityManagerFactory emf;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String phone = request.getParameter("phone");
        String idcard = request.getParameter("idcard");
        String address = request.getParameter("address");

        if (email != null && email.trim().length() > 0 && password != null && password.trim().length() > 0
                && name != null && name.trim().length() > 0 && surname != null && surname.trim().length() > 0
                && phone != null && phone.trim().length() > 0 && idcard != null && idcard.trim().length() > 0
                && address != null && address.trim().length() > 0) {

            String activatekey = UUID.randomUUID().toString().replace("-", "").substring(0, 15);
            password = new EncryptWithMd5().encrypt(password);

            AccountJpaController accountJpaCtrl = new AccountJpaController(utx, emf);
            Account accountFindAccount = accountJpaCtrl.findAccount(email);
            
            if (accountFindAccount == null) {
                Account account = new Account(email, password, new Date(), activatekey);

                try {
                    accountJpaCtrl.create(account);

                    CustomerJpaController customerJpaCtrl = new CustomerJpaController(utx, emf);
                    Customer customer = new Customer(name, surname, phone, idcard, address);
                    customer.setEmail(account);
                    customerJpaCtrl.create(customer);

                    //Send Email
                    String em = new EmailMessage(email, activatekey, "Register").getMessageSend();
                    int sendResult = SendEmail.send(email, em, "ยินดีต้อนรับเข้าสู่ BBM Project"); //SEND MAIL!
                    if (sendResult == 0) { //IS SENDING EMAIL successful?

                        //getEmailInDB
                        String getEmailInDB = account.getEmail();
                        request.setAttribute("getEmailInDB", getEmailInDB);
                        String status = "statusTrue";
                        request.setAttribute("status", status);
                    }
                } catch (RollbackFailureException ex) {
                    request.setAttribute("email", email);
                    request.setAttribute("status", "errorException");
                } catch (Exception ex) {
                    request.setAttribute("email", email);
                    request.setAttribute("status", "errorException");
                }
            } else {
                request.setAttribute("email", email);
                request.setAttribute("status", "UserHaveInDB");
            }

        }

        getServletContext().getRequestDispatcher("/Register.jsp").forward(request, response);
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
