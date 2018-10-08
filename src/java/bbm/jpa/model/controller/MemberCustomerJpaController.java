/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bbm.jpa.model.controller;

import bbm.jpa.model.MemberCustomer;
import bbm.jpa.model.controller.exceptions.NonexistentEntityException;
import bbm.jpa.model.controller.exceptions.PreexistingEntityException;
import bbm.jpa.model.controller.exceptions.RollbackFailureException;
import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.UserTransaction;

/**
 *
 * @author Kridtakom
 */
public class MemberCustomerJpaController implements Serializable {

    public MemberCustomerJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(MemberCustomer memberCustomer) throws PreexistingEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            em.persist(memberCustomer);
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findMemberCustomer(memberCustomer.getEmail()) != null) {
                throw new PreexistingEntityException("MemberCustomer " + memberCustomer + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(MemberCustomer memberCustomer) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            memberCustomer = em.merge(memberCustomer);
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                String id = memberCustomer.getEmail();
                if (findMemberCustomer(id) == null) {
                    throw new NonexistentEntityException("The memberCustomer with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(String id) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            MemberCustomer memberCustomer;
            try {
                memberCustomer = em.getReference(MemberCustomer.class, id);
                memberCustomer.getEmail();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The memberCustomer with id " + id + " no longer exists.", enfe);
            }
            em.remove(memberCustomer);
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

    public List<MemberCustomer> findMemberCustomerEntities() {
        return findMemberCustomerEntities(true, -1, -1);
    }

    public List<MemberCustomer> findMemberCustomerEntities(int maxResults, int firstResult) {
        return findMemberCustomerEntities(false, maxResults, firstResult);
    }

    private List<MemberCustomer> findMemberCustomerEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(MemberCustomer.class));
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

    public MemberCustomer findMemberCustomer(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(MemberCustomer.class, id);
        } finally {
            em.close();
        }
    }

    public int getMemberCustomerCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<MemberCustomer> rt = cq.from(MemberCustomer.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
