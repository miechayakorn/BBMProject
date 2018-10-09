/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bbm.servlet;

import bbm.jpa.model.MemberCustomer;
import bbm.jpa.model.controller.MemberCustomerJpaController;
import bbm.jpa.model.controller.exceptions.RollbackFailureException;
import bbm.model.EmailMessage;
import bbm.model.EncryptWithMd5;
import bbm.model.SendEmail;
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
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 *
 * @author Acer_E5
 */
public class RegisterServlet extends HttpServlet {

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
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String phone = request.getParameter("phone");

        if (email != null && email.trim().length() > 0
                && password != null && password.trim().length() > 0
                && name != null && name.trim().length() > 0
                && surname != null && surname.trim().length() > 0
                && phone != null && phone.trim().length() > 0) {

            MemberCustomerJpaController memberJPA = new MemberCustomerJpaController(utx, emf);

            String activatekey = UUID.randomUUID().toString().replace("-", "").substring(0, 15);
            password = new EncryptWithMd5().encrypt(password);
            MemberCustomer memberCustomer = new MemberCustomer(email, password, name, surname, phone, activatekey);

            try {
                memberJPA.create(memberCustomer);
                
                //Send Email
                String em = new EmailMessage(email, activatekey , "Register").getMessageSend();
                int sendResult = SendEmail.send(email, em , "ยินดีต้อนรับเข้าสู่ BBM Project"); //SEND MAIL!
                if (sendResult == 0) { //IS SENDING EMAIL successful?

                    //getEmailInDB
                    String getEmailInDB = memberCustomer.getEmail();
                    request.setAttribute("getEmailInDB", getEmailInDB);
                    String status = "statusTrue";
                    request.setAttribute("status", status);
                }
            } catch (RollbackFailureException ex) {
                //System.out.println("มีชื่อผู้ใช้นี้ในระบบ");
                String status = "UserHaveInDB";
                request.setAttribute("status", status);

                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
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
