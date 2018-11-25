package bbm.model;

import bbm.jpa.model.Room;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class BigCart implements Serializable {

    private Map<Integer, LineRoom> cart;

    public BigCart() {
        cart = new HashMap();
    }

    public boolean add(Room r) {
        LineRoom line = cart.get(r.getRoomnumber());
        if (r.getAvailable() == 0) {
            cart.put(r.getRoomnumber(), new LineRoom(r));
            return true;
        } else {
            return false;
        }
    }

    public void remove(Integer productCode) {
        this.remove(productCode);
    }

    public void remove(Room r) {
        cart.remove(r.getRoomnumber());
    }
    
    public BigDecimal getTotalPrice(){
        BigDecimal sumPrice = BigDecimal.ZERO;
        Collection <LineRoom> lineroom = cart.values();
        for (LineRoom lineRoom : lineroom) {
            sumPrice = sumPrice.add(lineRoom.getTotalPrice());
        }
        return sumPrice;
    }
    
    public int getQuantity(){
        int sum = 0;
        Collection <LineRoom> lineroom = cart.values();
        for (LineRoom lineRoom : lineroom) {
            sum += lineRoom.getQuantity();
        }
        return sum;
    }
    
    public List getLineRoom(){
        return new ArrayList(cart.values());
    }
}
