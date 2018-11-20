package bbm.servlet;

import bbm.jpa.model.Room;
import bbm.jpa.model.controller.RoomJpaController;
import java.io.IOException;
import java.io.PrintWriter;
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

public class RemainingRoomServlet extends HttpServlet {

    @Resource
    UserTransaction utx;

    @PersistenceUnit(unitName = "BBMWebAppPU")
    EntityManagerFactory emf;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RoomJpaController roomJpa = new RoomJpaController(utx, emf);
        List<Room> roomAvailable = roomJpa.searchRoomStatus(0);
        List<Room> roomNotAvailable = roomJpa.searchRoomStatus(1);
        int available = 0;
        int notAvailable = 0;
        for (Room roomLoop : roomAvailable) {
            if (roomLoop.getAvailable() == 0) {
                available++;
            }
        }
        for (Room roomLoop : roomNotAvailable) {
            if (roomLoop.getAvailable() == 1) {
                notAvailable++;
            }
        }
        request.setAttribute("remaining", available);
        request.setAttribute("sold", notAvailable);

        List<Room> roomByFloor1 = roomJpa.searchByFloor1();
        List<Room> roomByFloor2 = roomJpa.searchByFloor2();
        List<Room> roomByFloor3 = roomJpa.searchByFloor3();
        List<Room> roomByFloor4 = roomJpa.searchByFloor4();
        List<Room> roomByFloor5 = roomJpa.searchByFloor5();
        List<Room> roomByFloor6 = roomJpa.searchByFloor6();
        List<Room> roomByFloor7 = roomJpa.searchByFloor7();
        List<Room> roomByFloor8 = roomJpa.searchByFloor8();

        request.setAttribute("floor1Lists", roomByFloor1);
        request.setAttribute("floor2Lists", roomByFloor2);
        request.setAttribute("floor3Lists", roomByFloor3);
        request.setAttribute("floor4Lists", roomByFloor4);
        request.setAttribute("floor5Lists", roomByFloor5);
        request.setAttribute("floor6Lists", roomByFloor6);
        request.setAttribute("floor7Lists", roomByFloor7);
        request.setAttribute("floor8Lists", roomByFloor8);

        HttpSession session = request.getSession(false);
        if (session == null) {
            session = request.getSession(true);
        }
        if (session.getAttribute("roomSelectList") == null) {
            List<Integer> roomSelectList = new ArrayList<Integer>();
            session.setAttribute("roomSelectList", roomSelectList);

        } else if (session.getAttribute("roomSelectList") != null) {
            List<Integer> roomSelectList = (ArrayList<Integer>) session.getAttribute("roomSelectList");
            session.setAttribute("roomSelectList", roomSelectList);
        }

        getServletContext().getRequestDispatcher("/RemainingRoom.jsp").forward(request, response);
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
