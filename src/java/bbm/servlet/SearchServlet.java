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
import javax.persistence.Entity;
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
public class SearchServlet extends HttpServlet {
    @Resource UserTransaction utx;
    @PersistenceUnit(unitName = "BBMWebAppPU") EntityManagerFactory emf;
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
        String search =request.getParameter("search");
        String value =request.getParameter("value");
        HttpSession session = request.getSession(true);
        
        
        switch (search){
            case "size" : 
                if(value != null ){
                    RoomJpaController roomJpaCtrl = new RoomJpaController(utx, emf);
                    value = value+"Sq.M";
                    List<Room> sizeRoom = roomJpaCtrl.findBySizeRoom(value);
                    for (Room room : sizeRoom) {
                        System.out.println(room.getRoomnumber());
                    }
                    request.setAttribute("sizeRoom", sizeRoom);
                    request.getRequestDispatcher("/#").forward(request, response);
                    return;
                } 
                break ;
            case "type" :
                if (value != null && value.length()<2) {
                    RoomJpaController roomJpaCtrl = new RoomJpaController(utx, emf);
                    value = value.toUpperCase();
                    List<Room> typeRoom = roomJpaCtrl.findByTypeRoom(value);
                    for (Room room : typeRoom) {
                        System.out.println(room.getRoomnumber()+"  "+room.getTyperoom());
                    }
                    request.setAttribute("typeRoom", typeRoom);
                    request.getRequestDispatcher("/#").forward(request, response);
                    return;
                }
                break ;
            case "grather_than" :
                double price = Double.parseDouble(value);
                if (price >0 ) {
                    RoomJpaController roomJpaCtrl = new RoomJpaController(utx, emf);
                    List<Room> priceRoomMore = roomJpaCtrl.findByPriceMoreThan(price);
                    for (Room room : priceRoomMore) {
                        System.out.println(room.getRoomnumber()+"  "+room.getTyperoom());
                    }
                    request.setAttribute("priceRoomMore", priceRoomMore);
                    request.getRequestDispatcher("/#").forward(request, response);
                    return;
                }
                break ;
        };
        
        
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
