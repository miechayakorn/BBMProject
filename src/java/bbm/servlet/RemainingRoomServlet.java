/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bbm.servlet;

import bbm.jpa.model.Room;
import bbm.jpa.model.controller.RoomJpaController;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
public class RemainingRoomServlet extends HttpServlet {

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
        
        RoomJpaController roomJpa = new RoomJpaController(utx, emf);
        List<Room> room = roomJpa.searchRoomStatus();
       // String roomSelect = request.getParameter("room");
      
       //System.out.println(room);
        int available = 0;
        int notAvailable = 0;
        /*for (Room roomLoop : room) {
            if (roomLoop.getAvailable() == 0) {
                available++;
            }
            if (roomLoop.getAvailable() == 1) {
                notAvailable++;
            }
        }*/
//        for (int i = 0; i < room.size(); i++) {
//            if ((room.get(i)).getAvailable() == 0) {
//                available++;
//            }
//            if ((room.get(i)).getAvailable() == 1) {
//                notAvailable++;
//            }
//        }
        List<Room> roomByFloor1 = roomJpa.searchByFloor1();
        List<Room> roomByFloor2 = roomJpa.searchByFloor2();
        List<Room> roomByFloor3 = roomJpa.searchByFloor3();
        List<Room> roomByFloor4 = roomJpa.searchByFloor4();
        List<Room> roomByFloor5 = roomJpa.searchByFloor5();
        List<Room> roomByFloor6 = roomJpa.searchByFloor6();
        List<Room> roomByFloor7 = roomJpa.searchByFloor7();
        List<Room> roomByFloor8 = roomJpa.searchByFloor8();
        
        request.setAttribute("floor1List", roomByFloor1);
        request.setAttribute("floor2List", roomByFloor2);
        request.setAttribute("floor3List", roomByFloor3);
        request.setAttribute("floor4List", roomByFloor4);
        request.setAttribute("floor5List", roomByFloor5);
        request.setAttribute("floor6List", roomByFloor6);
        request.setAttribute("floor7List", roomByFloor7);
        request.setAttribute("floor8List", roomByFloor8);
        
        
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
