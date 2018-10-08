/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bbm.jpa.model;

import java.io.Serializable;
import java.util.Date;
import java.util.UUID;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Kridtakom
 */
@Entity
@Table(name = "MEMBERCUSTOMER")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "MemberCustomer.findAll", query = "SELECT m FROM MemberCustomer m")
    , @NamedQuery(name = "MemberCustomer.findByEmail", query = "SELECT m FROM MemberCustomer m WHERE m.email = :email")
    , @NamedQuery(name = "MemberCustomer.findByPassword", query = "SELECT m FROM MemberCustomer m WHERE m.password = :password")
    , @NamedQuery(name = "MemberCustomer.findByName", query = "SELECT m FROM MemberCustomer m WHERE m.name = :name")
    , @NamedQuery(name = "MemberCustomer.findBySurname", query = "SELECT m FROM MemberCustomer m WHERE m.surname = :surname")
    , @NamedQuery(name = "MemberCustomer.findByPhone", query = "SELECT m FROM MemberCustomer m WHERE m.phone = :phone")
    , @NamedQuery(name = "MemberCustomer.findByRegisterdate", query = "SELECT m FROM MemberCustomer m WHERE m.registerdate = :registerdate")
    , @NamedQuery(name = "MemberCustomer.findByActivatekey", query = "SELECT m FROM MemberCustomer m WHERE m.activatekey = :activatekey")
    , @NamedQuery(name = "MemberCustomer.findByActivatedate", query = "SELECT m FROM MemberCustomer m WHERE m.activatedate = :activatedate")})
public class MemberCustomer implements Serializable {

    private static final long serialVersionUID = 1L;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "EMAIL")
    private String email;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 40)
    @Column(name = "PASSWORD")
    private String password;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "NAME")
    private String name;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "SURNAME")
    private String surname;
    // @Pattern(regexp="^\\(?(\\d{3})\\)?[- ]?(\\d{3})[- ]?(\\d{4})$", message="Invalid phone/fax format, should be as xxx-xxx-xxxx")//if the field contains phone or fax number consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "PHONE")
    private String phone;
    @Column(name = "REGISTERDATE")
    @Temporal(TemporalType.TIMESTAMP)
    private Date registerdate;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 40)
    @Column(name = "ACTIVATEKEY")
    private String activatekey;
    @Column(name = "ACTIVATEDATE")
    @Temporal(TemporalType.TIMESTAMP)
    private Date activatedate;

    public MemberCustomer() {
    }

    public MemberCustomer(String email) {
        this.email = email;
    }

    public MemberCustomer(String email, String password, String name, String surname, String phone) {
        this.email = email;
        this.password = password;
        this.name = name;
        this.surname = surname;
        this.phone = phone;
        this.registerdate = new Date();
        this.activatekey = UUID.randomUUID().toString().replace("-","").substring(0,15);
    }

    public MemberCustomer(String email, String password, String name, String surname, String phone, String activatekey) {
        this.email = email;
        this.password = password;
        this.name = name;
        this.surname = surname;
        this.phone = phone;
        this.activatekey = activatekey;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getRegisterdate() {
        return registerdate;
    }

    public void setRegisterdate(Date registerdate) {
        this.registerdate = registerdate;
    }

    public String getActivatekey() {
        return activatekey;
    }

    public void setActivatekey(String activatekey) {
        this.activatekey = activatekey;
    }

    public Date getActivatedate() {
        return activatedate;
    }

    public void setActivatedate(Date activatedate) {
        this.activatedate = activatedate;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (email != null ? email.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MemberCustomer)) {
            return false;
        }
        MemberCustomer other = (MemberCustomer) object;
        if ((this.email == null && other.email != null) || (this.email != null && !this.email.equals(other.email))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bbm.jpa.model.MemberCustomer[ email=" + email + " ]";
    }

}
