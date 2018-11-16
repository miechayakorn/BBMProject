/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bbm.jpa.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Kridtakom
 */
@Entity
@Table(name = "ROOM")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Room.findAll", query = "SELECT r FROM Room r")
    , @NamedQuery(name = "Room.findByRoomnumber", query = "SELECT r FROM Room r WHERE r.roomnumber = :roomnumber")
    , @NamedQuery(name = "Room.findByFloor", query = "SELECT r FROM Room r WHERE r.floor = :floor")
    , @NamedQuery(name = "Room.findBySizeroom", query = "SELECT r FROM Room r WHERE r.sizeroom BETWEEN 0 AND :sizeroom")
    , @NamedQuery(name = "Room.findByTyperoom", query = "SELECT r FROM Room r WHERE r.typeroom = :typeroom")
    , @NamedQuery(name = "Room.findByAvailable", query = "SELECT r FROM Room r WHERE r.available = :available")
    , @NamedQuery(name = "Room.findByBedroom", query = "SELECT r FROM Room r WHERE r.bedroom = :bedroom")
    , @NamedQuery(name = "Room.findByToilet", query = "SELECT r FROM Room r WHERE r.toilet = :toilet")
    , @NamedQuery(name = "Room.findByPrice", query = "SELECT r FROM Room r WHERE r.price = :price")
    , @NamedQuery(name = "Room.searchByFloor1", query = "SELECT r FROM Room r WHERE r.floor = 1")
    , @NamedQuery(name = "Room.searchByFloor2", query = "SELECT r FROM Room r WHERE r.floor = 2")
    , @NamedQuery(name = "Room.searchByFloor3", query = "SELECT r FROM Room r WHERE r.floor = 3")
    , @NamedQuery(name = "Room.searchByFloor4", query = "SELECT r FROM Room r WHERE r.floor = 4")
    , @NamedQuery(name = "Room.searchByFloor5", query = "SELECT r FROM Room r WHERE r.floor = 5")
    , @NamedQuery(name = "Room.searchByFloor6", query = "SELECT r FROM Room r WHERE r.floor = 6")
    , @NamedQuery(name = "Room.searchByFloor7", query = "SELECT r FROM Room r WHERE r.floor = 7")
    , @NamedQuery(name = "Room.searchByFloor8", query = "SELECT r FROM Room r WHERE r.floor = 8")
    , @NamedQuery(name = "Room.findByPriceMoreThan", query = "SELECT r FROM Room r WHERE r.price > :price")
    , @NamedQuery(name = "Room.findByPriceLessThan", query = "SELECT r FROM Room r WHERE r.price < :price")
})

public class Room implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ROOMNUMBER")
    private Integer roomnumber;
    @Basic(optional = false)
    @NotNull
    @Column(name = "FLOOR")
    private int floor;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "SIZEROOM")
    private String sizeroom;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1)
    @Column(name = "TYPEROOM")
    private String typeroom;
    @Basic(optional = false)
    @NotNull
    @Column(name = "AVAILABLE")
    private int available;
    @Basic(optional = false)
    @NotNull
    @Column(name = "BEDROOM")
    private int bedroom;
    @Basic(optional = false)
    @NotNull
    @Column(name = "TOILET")
    private int toilet;
    @Basic(optional = false)
    @NotNull
    @Column(name = "PRICE")
    private double price;
    @JoinColumn(name = "CUSTOMERID", referencedColumnName = "CUSTOMERID")
    @ManyToOne
    private Customer customerid;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "roomnumber")
    private List<History> historyList;

    public Room() {
    }

    public Room(Integer roomnumber) {
        this.roomnumber = roomnumber;
    }

    public Room(Integer roomnumber, int floor, String sizeroom, String typeroom, int available, int bedroom, int toilet, double price) {
        this.roomnumber = roomnumber;
        this.floor = floor;
        this.sizeroom = sizeroom;
        this.typeroom = typeroom;
        this.available = available;
        this.bedroom = bedroom;
        this.toilet = toilet;
        this.price = price;
    }

    public Integer getRoomnumber() {
        return roomnumber;
    }

    public void setRoomnumber(Integer roomnumber) {
        this.roomnumber = roomnumber;
    }

    public int getFloor() {
        return floor;
    }

    public void setFloor(int floor) {
        this.floor = floor;
    }

    public String getSizeroom() {
        return sizeroom;
    }

    public void setSizeroom(String sizeroom) {
        this.sizeroom = sizeroom;
    }

    public String getTyperoom() {
        return typeroom;
    }

    public void setTyperoom(String typeroom) {
        this.typeroom = typeroom;
    }

    public int getAvailable() {
        return available;
    }

    public void setAvailable(int available) {
        this.available = available;
    }

    public int getBedroom() {
        return bedroom;
    }

    public void setBedroom(int bedroom) {
        this.bedroom = bedroom;
    }

    public int getToilet() {
        return toilet;
    }

    public void setToilet(int toilet) {
        this.toilet = toilet;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Customer getCustomerid() {
        return customerid;
    }

    public void setCustomerid(Customer customerid) {
        this.customerid = customerid;
    }

    @XmlTransient
    public List<History> getHistoryList() {
        return historyList;
    }

    public void setHistoryList(List<History> historyList) {
        this.historyList = historyList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (roomnumber != null ? roomnumber.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Room)) {
            return false;
        }
        Room other = (Room) object;
        if ((this.roomnumber == null && other.roomnumber != null) || (this.roomnumber != null && !this.roomnumber.equals(other.roomnumber))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bbm.jpa.model.Room[ roomnumber=" + roomnumber + " ]";
    }

}
