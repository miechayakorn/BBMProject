package bbm.servlet;

import bbm.jpa.model.Room;
import bbm.jpa.model.controller.RoomJpaController;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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

public class SearchServlet extends HttpServlet {

    @Resource
    UserTransaction utx;
    @PersistenceUnit(unitName = "BBMWebAppPU")
    EntityManagerFactory emf;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String search = request.getParameter("search");
        String value = request.getParameter("value");

        RoomJpaController roomJpaCtrl = new RoomJpaController(utx, emf);
        List<Room> roomAvailable = roomJpaCtrl.searchRoomStatus(0);
        List<Room> roomNotAvailable = roomJpaCtrl.searchRoomStatus(1);
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

        List<Room> roomByFloor1 = roomJpaCtrl.searchByFloor1();
        List<Room> roomByFloor2 = roomJpaCtrl.searchByFloor2();
        List<Room> roomByFloor3 = roomJpaCtrl.searchByFloor3();
        List<Room> roomByFloor4 = roomJpaCtrl.searchByFloor4();
        List<Room> roomByFloor5 = roomJpaCtrl.searchByFloor5();
        List<Room> roomByFloor6 = roomJpaCtrl.searchByFloor6();
        List<Room> roomByFloor7 = roomJpaCtrl.searchByFloor7();
        List<Room> roomByFloor8 = roomJpaCtrl.searchByFloor8();

        request.setAttribute("floor1Lists", roomByFloor1);
        request.setAttribute("floor2Lists", roomByFloor2);
        request.setAttribute("floor3Lists", roomByFloor3);
        request.setAttribute("floor4Lists", roomByFloor4);
        request.setAttribute("floor5Lists", roomByFloor5);
        request.setAttribute("floor6Lists", roomByFloor6);
        request.setAttribute("floor7Lists", roomByFloor7);
        request.setAttribute("floor8Lists", roomByFloor8);

        if (search != null) {
            switch (search) {
                case "size":
                    if (value != null) {
                        try {
                            List<Room> sizeRoom = roomJpaCtrl.findBySizeRoom(Double.parseDouble(value));
                            if (sizeRoom != null) {
                                List<Integer> searchRoomNumber = new ArrayList<Integer>();
                                for (Room room : sizeRoom) {
                                    searchRoomNumber.add(room.getRoomnumber());
                                }
                                request.setAttribute("searchRoomNumber", searchRoomNumber);
                            }
                        } catch (Exception e) {
                            request.getRequestDispatcher("/RemainingRoom.jsp").forward(request, response);
                            return;
                        }
                        request.getRequestDispatcher("/RemainingRoom.jsp").forward(request, response);
                        return;
                    }
                    break;

                case "type":
                    if (value != null && value.length() < 2) {
                        value = value.toUpperCase();
                        List<Room> typeRoom = roomJpaCtrl.findByTypeRoom(value);
                        List<Integer> searchTypeRoom = new ArrayList<Integer>();
                        for (Room room : typeRoom) {
                            searchTypeRoom.add(room.getRoomnumber());
                        }
                        request.setAttribute("searchRoomNumber", searchTypeRoom);
                        request.getRequestDispatcher("/RemainingRoom.jsp").forward(request, response);
                        return;
                    }
                    break;
                case "grather_than":
                    try {
                        double priceMore = Double.parseDouble(value);
                        if (priceMore > 0) {
                            List<Room> priceRoomMore = roomJpaCtrl.findByPriceMoreThan(priceMore);
                            List<Integer> searchPriceRoomMore = new ArrayList<Integer>();
                            for (Room room : priceRoomMore) {
                                searchPriceRoomMore.add(room.getRoomnumber());
                            }
                            request.setAttribute("searchRoomNumber", searchPriceRoomMore);
                            request.getRequestDispatcher("/RemainingRoom.jsp").forward(request, response);
                            return;
                        }
                    } catch (Exception e) {
                        request.getRequestDispatcher("/RemainingRoom.jsp").forward(request, response);
                        return;
                    }
                    break;
                case "less_than":
                    try {
                        double priceLess = Double.parseDouble(value);
                        if (priceLess > 0) {
                            List<Room> priceRoomLess = roomJpaCtrl.findByPriceLessThan(priceLess);
                            List<Integer> searchPriceRoomLess = new ArrayList<Integer>();
                            for (Room room : priceRoomLess) {
                                searchPriceRoomLess.add(room.getRoomnumber());
                            }
                            request.setAttribute("searchRoomNumber", searchPriceRoomLess);
                            request.getRequestDispatcher("/RemainingRoom.jsp").forward(request, response);
                            return;
                        }
                    } catch (Exception e) {
                        request.getRequestDispatcher("/RemainingRoom.jsp").forward(request, response);
                        return;
                    }
                    break;

            };
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
