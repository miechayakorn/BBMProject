package bbm.servlet;

import bbm.jpa.model.Customer;
import bbm.jpa.model.History;
import bbm.jpa.model.Room;
import bbm.jpa.model.controller.CustomerJpaController;
import bbm.jpa.model.controller.HistoryJpaController;
import bbm.jpa.model.controller.RoomJpaController;
import bbm.jpa.model.controller.exceptions.NonexistentEntityException;
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
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

public class AfterPaymentServlet extends HttpServlet {

    @Resource
    UserTransaction utx;
    @PersistenceUnit(unitName = "BBMWebAppPU")
    EntityManagerFactory emf;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        String[] roomNum = request.getParameterValues("roomnumber");
        if (session != null) {
            Customer customerSes = (Customer) session.getAttribute("customer");
            if (customerSes != null) {
                CustomerJpaController customerJpaCtrl = new CustomerJpaController(utx, emf);
                Customer customer = customerJpaCtrl.findCustomer(customerSes.getCustomerid());
                HistoryJpaController historyJpaCtrl = new HistoryJpaController(utx, emf);
                if (roomNum != null) {
                    for (int i = 0; i < roomNum.length; i++) {
                        System.out.println(roomNum[i]);
                        RoomJpaController RoomJpaCtrl = new RoomJpaController(utx, emf);
                        Room room = RoomJpaCtrl.findRoom(Integer.parseInt(roomNum[i]));
                        room.setAvailable(1);
                        room.setCustomerid(customer);
                        History history = new History(room, (int) room.getPrice(), new Date(), customer);
                        try {
                            RoomJpaCtrl.edit(room);
                            historyJpaCtrl.create(history);
                            request.setAttribute("messageAfterPayment", "success");
                        } catch (NonexistentEntityException ex) {
                            Logger.getLogger(AfterPaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
                        } catch (RollbackFailureException ex) {
                            Logger.getLogger(AfterPaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
                        } catch (Exception ex) {
                            Logger.getLogger(AfterPaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }

                    }
                    session.removeAttribute("cart");
                    getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
                    return;
                }
                response.sendRedirect("RemainingRoom#selectRoom");
                return;
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
