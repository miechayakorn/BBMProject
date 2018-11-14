/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bbm.jpa.model.controller;

import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import bbm.jpa.model.Customer;
import bbm.jpa.model.History;
import bbm.jpa.model.Room;
import bbm.jpa.model.controller.exceptions.NonexistentEntityException;
import bbm.jpa.model.controller.exceptions.RollbackFailureException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;

/**
 *
 * @author Kridtakom
 */
public class HistoryJpaController implements Serializable {

    public HistoryJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(History history) throws RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Customer customerid = history.getCustomerid();
            if (customerid != null) {
                customerid = em.getReference(customerid.getClass(), customerid.getCustomerid());
                history.setCustomerid(customerid);
            }
            Room roomnumber = history.getRoomnumber();
            if (roomnumber != null) {
                roomnumber = em.getReference(roomnumber.getClass(), roomnumber.getRoomnumber());
                history.setRoomnumber(roomnumber);
            }
            em.persist(history);
            if (customerid != null) {
                customerid.getHistoryList().add(history);
                customerid = em.merge(customerid);
            }
            if (roomnumber != null) {
                roomnumber.getHistoryList().add(history);
                roomnumber = em.merge(roomnumber);
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(History history) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            History persistentHistory = em.find(History.class, history.getHistoryid());
            Customer customeridOld = persistentHistory.getCustomerid();
            Customer customeridNew = history.getCustomerid();
            Room roomnumberOld = persistentHistory.getRoomnumber();
            Room roomnumberNew = history.getRoomnumber();
            if (customeridNew != null) {
                customeridNew = em.getReference(customeridNew.getClass(), customeridNew.getCustomerid());
                history.setCustomerid(customeridNew);
            }
            if (roomnumberNew != null) {
                roomnumberNew = em.getReference(roomnumberNew.getClass(), roomnumberNew.getRoomnumber());
                history.setRoomnumber(roomnumberNew);
            }
            history = em.merge(history);
            if (customeridOld != null && !customeridOld.equals(customeridNew)) {
                customeridOld.getHistoryList().remove(history);
                customeridOld = em.merge(customeridOld);
            }
            if (customeridNew != null && !customeridNew.equals(customeridOld)) {
                customeridNew.getHistoryList().add(history);
                customeridNew = em.merge(customeridNew);
            }
            if (roomnumberOld != null && !roomnumberOld.equals(roomnumberNew)) {
                roomnumberOld.getHistoryList().remove(history);
                roomnumberOld = em.merge(roomnumberOld);
            }
            if (roomnumberNew != null && !roomnumberNew.equals(roomnumberOld)) {
                roomnumberNew.getHistoryList().add(history);
                roomnumberNew = em.merge(roomnumberNew);
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = history.getHistoryid();
                if (findHistory(id) == null) {
                    throw new NonexistentEntityException("The history with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            History history;
            try {
                history = em.getReference(History.class, id);
                history.getHistoryid();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The history with id " + id + " no longer exists.", enfe);
            }
            Customer customerid = history.getCustomerid();
            if (customerid != null) {
                customerid.getHistoryList().remove(history);
                customerid = em.merge(customerid);
            }
            Room roomnumber = history.getRoomnumber();
            if (roomnumber != null) {
                roomnumber.getHistoryList().remove(history);
                roomnumber = em.merge(roomnumber);
            }
            em.remove(history);
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<History> findHistoryEntities() {
        return findHistoryEntities(true, -1, -1);
    }

    public List<History> findHistoryEntities(int maxResults, int firstResult) {
        return findHistoryEntities(false, maxResults, firstResult);
    }

    private List<History> findHistoryEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(History.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public History findHistory(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(History.class, id);
        } finally {
            em.close();
        }
    }

    public int getHistoryCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<History> rt = cq.from(History.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
