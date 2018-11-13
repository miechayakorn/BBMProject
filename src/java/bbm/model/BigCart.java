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

    private Map<String, LineRoom> cart;

    public BigCart() {
        cart = new HashMap();
    }

    public void add(Room r) {
        LineRoom line = cart.get(r.getRoomnumber());
        if (r.getAvailable().equals('u')) {
            cart.
        }
    }

}
