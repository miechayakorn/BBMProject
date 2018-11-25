package bbm.servlet;

import bbm.jpa.model.Customer;
import bbm.jpa.model.History;
import bbm.jpa.model.controller.CustomerJpaController;
import java.io.IOException;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

public class HistoryServlet extends HttpServlet {

    @Resource
    UserTransaction utx;
    @PersistenceUnit(unitName = "BBMWebAppPU")
    EntityManagerFactory emf;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session != null) {
            Customer cusSession = (Customer) session.getAttribute("customer");

            if (cusSession != null) {
                CustomerJpaController customerJpaCtrl = new CustomerJpaController(utx, emf);
                Customer customer = customerJpaCtrl.findCustomer(cusSession.getCustomerid());

                if (customer != null) {
                    List<History> listHistory = customer.getHistoryList();
                    session.setAttribute("listHistory", listHistory);
                    getServletContext().getRequestDispatcher("/History.jsp").forward(request, response);
                    return;
                }
            }
        }
        response.sendRedirect("Login");

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
