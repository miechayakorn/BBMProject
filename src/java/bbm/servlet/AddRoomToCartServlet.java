package bbm.servlet;

import bbm.jpa.model.Room;
import bbm.jpa.model.controller.RoomJpaController;
import bbm.model.BigCart;
import java.io.IOException;
import java.util.ArrayList;
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

public class AddRoomToCartServlet extends HttpServlet {

    @Resource
    UserTransaction utx;
    @PersistenceUnit(unitName = "BBMWebAppPU")
    EntityManagerFactory emf;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String roomNumber = request.getParameter("roomnumber");

        if (session == null) {
            request.getSession(true);
        }
        
        if (session.getAttribute("cart") == null) {
            BigCart cart = new BigCart();
            session.setAttribute("cart", cart);
        }

        if (roomNumber != null) {
            RoomJpaController roomJpaCtrl = new RoomJpaController(utx, emf);
            Room room = roomJpaCtrl.findRoom(Integer.parseInt(roomNumber));
            BigCart cart = (BigCart) session.getAttribute("cart");
            cart.add(room);
            session.setAttribute("cart", cart);
            request.setAttribute("message", "You add to Bigcart success");

            if (session.getAttribute("roomSelectList") == null) {
                List<Integer> roomSelectList = new ArrayList<>();
                roomSelectList.add(Integer.parseInt(roomNumber));
                session.setAttribute("roomSelectList", roomSelectList);

            } else if (session.getAttribute("roomSelectList") != null) {
                List<Integer> roomSelectList = (ArrayList<Integer>) session.getAttribute("roomSelectList");
                roomSelectList.add(Integer.parseInt(roomNumber));
                session.setAttribute("roomSelectList", roomSelectList);
            }

        }
        getServletContext().getRequestDispatcher("/RemainingRoom").forward(request, response);

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
