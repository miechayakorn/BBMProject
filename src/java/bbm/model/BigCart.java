/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bbm.model;

import bbm.jpa.model.Room;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
import static jdk.nashorn.internal.objects.NativeArray.map;

/**
 *
 * @author Kridtakom
 */
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

    public boolean remove(Room r) {
        cart.remove(r.getRoomnumber());
        return true;
    }
    
    

}
