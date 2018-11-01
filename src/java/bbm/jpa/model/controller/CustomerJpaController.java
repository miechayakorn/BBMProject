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
import bbm.jpa.model.Account;
import bbm.jpa.model.Customer;
import java.util.ArrayList;
import java.util.List;
import bbm.jpa.model.Room;
import bbm.jpa.model.History;
import bbm.jpa.model.controller.exceptions.IllegalOrphanException;
import bbm.jpa.model.controller.exceptions.NonexistentEntityException;
import bbm.jpa.model.controller.exceptions.PreexistingEntityException;
import bbm.jpa.model.controller.exceptions.RollbackFailureException;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;

/**
 *
 * @author Student
 */
public class CustomerJpaController implements Serializable {

    public CustomerJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Customer customer) throws PreexistingEntityException, RollbackFailureException, Exception {
        if (customer.getAccountList() == null) {
            customer.setAccountList(new ArrayList<Account>());
        }
        if (customer.getRoomList() == null) {
            customer.setRoomList(new ArrayList<Room>());
        }
        if (customer.getHistoryList() == null) {
            customer.setHistoryList(new ArrayList<History>());
        }
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            List<Account> attachedAccountList = new ArrayList<Account>();
            for (Account accountListAccountToAttach : customer.getAccountList()) {
                accountListAccountToAttach = em.getReference(accountListAccountToAttach.getClass(), accountListAccountToAttach.getEmail());
                attachedAccountList.add(accountListAccountToAttach);
            }
            customer.setAccountList(attachedAccountList);
            List<Room> attachedRoomList = new ArrayList<Room>();
            for (Room roomListRoomToAttach : customer.getRoomList()) {
                roomListRoomToAttach = em.getReference(roomListRoomToAttach.getClass(), roomListRoomToAttach.getRoomnumber());
                attachedRoomList.add(roomListRoomToAttach);
            }
            customer.setRoomList(attachedRoomList);
            List<History> attachedHistoryList = new ArrayList<History>();
            for (History historyListHistoryToAttach : customer.getHistoryList()) {
                historyListHistoryToAttach = em.getReference(historyListHistoryToAttach.getClass(), historyListHistoryToAttach.getHistoryid());
                attachedHistoryList.add(historyListHistoryToAttach);
            }
            customer.setHistoryList(attachedHistoryList);
            em.persist(customer);
            for (Account accountListAccount : customer.getAccountList()) {
                Customer oldCustomeridOfAccountListAccount = accountListAccount.getCustomerid();
                accountListAccount.setCustomerid(customer);
                accountListAccount = em.merge(accountListAccount);
                if (oldCustomeridOfAccountListAccount != null) {
                    oldCustomeridOfAccountListAccount.getAccountList().remove(accountListAccount);
                    oldCustomeridOfAccountListAccount = em.merge(oldCustomeridOfAccountListAccount);
                }
            }
            for (Room roomListRoom : customer.getRoomList()) {
                Customer oldCustomeridOfRoomListRoom = roomListRoom.getCustomerid();
                roomListRoom.setCustomerid(customer);
                roomListRoom = em.merge(roomListRoom);
                if (oldCustomeridOfRoomListRoom != null) {
                    oldCustomeridOfRoomListRoom.getRoomList().remove(roomListRoom);
                    oldCustomeridOfRoomListRoom = em.merge(oldCustomeridOfRoomListRoom);
                }
            }
            for (History historyListHistory : customer.getHistoryList()) {
                Customer oldCustomeridOfHistoryListHistory = historyListHistory.getCustomerid();
                historyListHistory.setCustomerid(customer);
                historyListHistory = em.merge(historyListHistory);
                if (oldCustomeridOfHistoryListHistory != null) {
                    oldCustomeridOfHistoryListHistory.getHistoryList().remove(historyListHistory);
                    oldCustomeridOfHistoryListHistory = em.merge(oldCustomeridOfHistoryListHistory);
                }
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findCustomer(customer.getCustomerid()) != null) {
                throw new PreexistingEntityException("Customer " + customer + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Customer customer) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Customer persistentCustomer = em.find(Customer.class, customer.getCustomerid());
            List<Account> accountListOld = persistentCustomer.getAccountList();
            List<Account> accountListNew = customer.getAccountList();
            List<Room> roomListOld = persistentCustomer.getRoomList();
            List<Room> roomListNew = customer.getRoomList();
            List<History> historyListOld = persistentCustomer.getHistoryList();
            List<History> historyListNew = customer.getHistoryList();
            List<String> illegalOrphanMessages = null;
            for (Account accountListOldAccount : accountListOld) {
                if (!accountListNew.contains(accountListOldAccount)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Account " + accountListOldAccount + " since its customerid field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            List<Account> attachedAccountListNew = new ArrayList<Account>();
            for (Account accountListNewAccountToAttach : accountListNew) {
                accountListNewAccountToAttach = em.getReference(accountListNewAccountToAttach.getClass(), accountListNewAccountToAttach.getEmail());
                attachedAccountListNew.add(accountListNewAccountToAttach);
            }
            accountListNew = attachedAccountListNew;
            customer.setAccountList(accountListNew);
            List<Room> attachedRoomListNew = new ArrayList<Room>();
            for (Room roomListNewRoomToAttach : roomListNew) {
                roomListNewRoomToAttach = em.getReference(roomListNewRoomToAttach.getClass(), roomListNewRoomToAttach.getRoomnumber());
                attachedRoomListNew.add(roomListNewRoomToAttach);
            }
            roomListNew = attachedRoomListNew;
            customer.setRoomList(roomListNew);
            List<History> attachedHistoryListNew = new ArrayList<History>();
            for (History historyListNewHistoryToAttach : historyListNew) {
                historyListNewHistoryToAttach = em.getReference(historyListNewHistoryToAttach.getClass(), historyListNewHistoryToAttach.getHistoryid());
                attachedHistoryListNew.add(historyListNewHistoryToAttach);
            }
            historyListNew = attachedHistoryListNew;
            customer.setHistoryList(historyListNew);
            customer = em.merge(customer);
            for (Account accountListNewAccount : accountListNew) {
                if (!accountListOld.contains(accountListNewAccount)) {
                    Customer oldCustomeridOfAccountListNewAccount = accountListNewAccount.getCustomerid();
                    accountListNewAccount.setCustomerid(customer);
                    accountListNewAccount = em.merge(accountListNewAccount);
                    if (oldCustomeridOfAccountListNewAccount != null && !oldCustomeridOfAccountListNewAccount.equals(customer)) {
                        oldCustomeridOfAccountListNewAccount.getAccountList().remove(accountListNewAccount);
                        oldCustomeridOfAccountListNewAccount = em.merge(oldCustomeridOfAccountListNewAccount);
                    }
                }
            }
            for (Room roomListOldRoom : roomListOld) {
                if (!roomListNew.contains(roomListOldRoom)) {
                    roomListOldRoom.setCustomerid(null);
                    roomListOldRoom = em.merge(roomListOldRoom);
                }
            }
            for (Room roomListNewRoom : roomListNew) {
                if (!roomListOld.contains(roomListNewRoom)) {
                    Customer oldCustomeridOfRoomListNewRoom = roomListNewRoom.getCustomerid();
                    roomListNewRoom.setCustomerid(customer);
                    roomListNewRoom = em.merge(roomListNewRoom);
                    if (oldCustomeridOfRoomListNewRoom != null && !oldCustomeridOfRoomListNewRoom.equals(customer)) {
                        oldCustomeridOfRoomListNewRoom.getRoomList().remove(roomListNewRoom);
                        oldCustomeridOfRoomListNewRoom = em.merge(oldCustomeridOfRoomListNewRoom);
                    }
                }
            }
            for (History historyListOldHistory : historyListOld) {
                if (!historyListNew.contains(historyListOldHistory)) {
                    historyListOldHistory.setCustomerid(null);
                    historyListOldHistory = em.merge(historyListOldHistory);
                }
            }
            for (History historyListNewHistory : historyListNew) {
                if (!historyListOld.contains(historyListNewHistory)) {
                    Customer oldCustomeridOfHistoryListNewHistory = historyListNewHistory.getCustomerid();
                    historyListNewHistory.setCustomerid(customer);
                    historyListNewHistory = em.merge(historyListNewHistory);
                    if (oldCustomeridOfHistoryListNewHistory != null && !oldCustomeridOfHistoryListNewHistory.equals(customer)) {
                        oldCustomeridOfHistoryListNewHistory.getHistoryList().remove(historyListNewHistory);
                        oldCustomeridOfHistoryListNewHistory = em.merge(oldCustomeridOfHistoryListNewHistory);
                    }
                }
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
                Integer id = customer.getCustomerid();
                if (findCustomer(id) == null) {
                    throw new NonexistentEntityException("The customer with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Customer customer;
            try {
                customer = em.getReference(Customer.class, id);
                customer.getCustomerid();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The customer with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            List<Account> accountListOrphanCheck = customer.getAccountList();
            for (Account accountListOrphanCheckAccount : accountListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Customer (" + customer + ") cannot be destroyed since the Account " + accountListOrphanCheckAccount + " in its accountList field has a non-nullable customerid field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            List<Room> roomList = customer.getRoomList();
            for (Room roomListRoom : roomList) {
                roomListRoom.setCustomerid(null);
                roomListRoom = em.merge(roomListRoom);
            }
            List<History> historyList = customer.getHistoryList();
            for (History historyListHistory : historyList) {
                historyListHistory.setCustomerid(null);
                historyListHistory = em.merge(historyListHistory);
            }
            em.remove(customer);
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

    public List<Customer> findCustomerEntities() {
        return findCustomerEntities(true, -1, -1);
    }

    public List<Customer> findCustomerEntities(int maxResults, int firstResult) {
        return findCustomerEntities(false, maxResults, firstResult);
    }

    private List<Customer> findCustomerEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Customer.class));
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

    public Customer findCustomer(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Customer.class, id);
        } finally {
            em.close();
        }
    }

    public int getCustomerCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Customer> rt = cq.from(Customer.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
