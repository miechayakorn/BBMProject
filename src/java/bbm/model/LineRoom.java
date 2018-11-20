package bbm.model;

import bbm.jpa.model.Room;
import java.math.BigDecimal;


public class LineRoom {

    private Room room;
    private double salePrice;
    private int quantity;

    public LineRoom(Room room) {
        this(room, 1);
    }

    public LineRoom(Room room, int quantity) {
        this.room = room;
        this.salePrice = room.getPrice();
        this.quantity = quantity;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(double salePrice) {
        this.salePrice = salePrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getTotalPrice() {
        return (new BigDecimal(this.salePrice)).multiply(new BigDecimal(this.quantity));
    }

}
