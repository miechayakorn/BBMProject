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
 * @author Student
 */
@Entity
@Table(name = "ROOM")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Room.findAll", query = "SELECT r FROM Room r")
    , @NamedQuery(name = "Room.findByRoomnumber", query = "SELECT r FROM Room r WHERE r.roomnumber = :roomnumber")
    , @NamedQuery(name = "Room.findByFloor", query = "SELECT r FROM Room r WHERE r.floor = :floor")
    , @NamedQuery(name = "Room.findBySize", query = "SELECT r FROM Room r WHERE r.size = :size")
    , @NamedQuery(name = "Room.findByType", query = "SELECT r FROM Room r WHERE r.type = :type")
    , @NamedQuery(name = "Room.findByAvailable", query = "SELECT r FROM Room r WHERE r.available = :available")})
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
    @Size(max = 100)
    @Column(name = "SIZE")
    private String size;
    @Column(name = "TYPE")
    private Character type;
    @Column(name = "AVAILABLE")
    private Character available;
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

    public Room(Integer roomnumber, int floor) {
        this.roomnumber = roomnumber;
        this.floor = floor;
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

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public Character getType() {
        return type;
    }

    public void setType(Character type) {
        this.type = type;
    }

    public Character getAvailable() {
        return available;
    }

    public void setAvailable(Character available) {
        this.available = available;
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
