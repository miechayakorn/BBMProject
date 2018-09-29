/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bbm.jpa.model;

import java.io.Serializable;
import java.util.Date;
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
 * @author Acer_E5
 */
@Entity
@Table(name = "MEMBERCUSTOMER")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "MemberCustomer.findAll", query = "SELECT m FROM MemberCustomer m")
    , @NamedQuery(name = "MemberCustomer.findByEmail", query = "SELECT m FROM MemberCustomer m WHERE m.email = :email")
    , @NamedQuery(name = "MemberCustomer.findByPassword", query = "SELECT m FROM MemberCustomer m WHERE m.password = :password")
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

    public MemberCustomer(String email, String password, String activatekey) {
        this.email = email;
        this.password = password;
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
