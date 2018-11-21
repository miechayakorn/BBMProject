package bbm.jpa.model.controller;

import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import bbm.jpa.model.Customer;
import bbm.jpa.model.History;
import bbm.jpa.model.Room;
import bbm.jpa.model.controller.exceptions.IllegalOrphanException;
import bbm.jpa.model.controller.exceptions.NonexistentEntityException;
import bbm.jpa.model.controller.exceptions.PreexistingEntityException;
import bbm.jpa.model.controller.exceptions.RollbackFailureException;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;

public class RoomJpaController implements Serializable {

    public RoomJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Room room) throws PreexistingEntityException, RollbackFailureException, Exception {
        if (room.getHistoryList() == null) {
            room.setHistoryList(new ArrayList<History>());
        }
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Customer customerid = room.getCustomerid();
            if (customerid != null) {
                customerid = em.getReference(customerid.getClass(), customerid.getCustomerid());
                room.setCustomerid(customerid);
            }
            List<History> attachedHistoryList = new ArrayList<History>();
            for (History historyListHistoryToAttach : room.getHistoryList()) {
                historyListHistoryToAttach = em.getReference(historyListHistoryToAttach.getClass(), historyListHistoryToAttach.getHistoryid());
                attachedHistoryList.add(historyListHistoryToAttach);
            }
            room.setHistoryList(attachedHistoryList);
            em.persist(room);
            if (customerid != null) {
                customerid.getRoomList().add(room);
                customerid = em.merge(customerid);
            }
            for (History historyListHistory : room.getHistoryList()) {
                Room oldRoomnumberOfHistoryListHistory = historyListHistory.getRoomnumber();
                historyListHistory.setRoomnumber(room);
                historyListHistory = em.merge(historyListHistory);
                if (oldRoomnumberOfHistoryListHistory != null) {
                    oldRoomnumberOfHistoryListHistory.getHistoryList().remove(historyListHistory);
                    oldRoomnumberOfHistoryListHistory = em.merge(oldRoomnumberOfHistoryListHistory);
                }
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findRoom(room.getRoomnumber()) != null) {
                throw new PreexistingEntityException("Room " + room + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Room room) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Room persistentRoom = em.find(Room.class, room.getRoomnumber());
            Customer customeridOld = persistentRoom.getCustomerid();
            Customer customeridNew = room.getCustomerid();
            List<History> historyListOld = persistentRoom.getHistoryList();
            List<History> historyListNew = room.getHistoryList();
            List<String> illegalOrphanMessages = null;
            for (History historyListOldHistory : historyListOld) {
                if (!historyListNew.contains(historyListOldHistory)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain History " + historyListOldHistory + " since its roomnumber field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (customeridNew != null) {
                customeridNew = em.getReference(customeridNew.getClass(), customeridNew.getCustomerid());
                room.setCustomerid(customeridNew);
            }
            List<History> attachedHistoryListNew = new ArrayList<History>();
            for (History historyListNewHistoryToAttach : historyListNew) {
                historyListNewHistoryToAttach = em.getReference(historyListNewHistoryToAttach.getClass(), historyListNewHistoryToAttach.getHistoryid());
                attachedHistoryListNew.add(historyListNewHistoryToAttach);
            }
            historyListNew = attachedHistoryListNew;
            room.setHistoryList(historyListNew);
            room = em.merge(room);
            if (customeridOld != null && !customeridOld.equals(customeridNew)) {
                customeridOld.getRoomList().remove(room);
                customeridOld = em.merge(customeridOld);
            }
            if (customeridNew != null && !customeridNew.equals(customeridOld)) {
                customeridNew.getRoomList().add(room);
                customeridNew = em.merge(customeridNew);
            }
            for (History historyListNewHistory : historyListNew) {
                if (!historyListOld.contains(historyListNewHistory)) {
                    Room oldRoomnumberOfHistoryListNewHistory = historyListNewHistory.getRoomnumber();
                    historyListNewHistory.setRoomnumber(room);
                    historyListNewHistory = em.merge(historyListNewHistory);
                    if (oldRoomnumberOfHistoryListNewHistory != null && !oldRoomnumberOfHistoryListNewHistory.equals(room)) {
                        oldRoomnumberOfHistoryListNewHistory.getHistoryList().remove(historyListNewHistory);
                        oldRoomnumberOfHistoryListNewHistory = em.merge(oldRoomnumberOfHistoryListNewHistory);
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
                Integer id = room.getRoomnumber();
                if (findRoom(id) == null) {
                    throw new NonexistentEntityException("The room with id " + id + " no longer exists.");
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
            Room room;
            try {
                room = em.getReference(Room.class, id);
                room.getRoomnumber();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The room with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            List<History> historyListOrphanCheck = room.getHistoryList();
            for (History historyListOrphanCheckHistory : historyListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Room (" + room + ") cannot be destroyed since the History " + historyListOrphanCheckHistory + " in its historyList field has a non-nullable roomnumber field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            Customer customerid = room.getCustomerid();
            if (customerid != null) {
                customerid.getRoomList().remove(room);
                customerid = em.merge(customerid);
            }
            em.remove(room);
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

    public List<Room> findRoomEntities() {
        return findRoomEntities(true, -1, -1);
    }

    public List<Room> findRoomEntities(int maxResults, int firstResult) {
        return findRoomEntities(false, maxResults, firstResult);
    }

    private List<Room> findRoomEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Room.class));
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

    public Room findRoom(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Room.class, id);
        } finally {
            em.close();
        }
    }

    public List<Room> searchRoomStatus(int checkAvailable) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNamedQuery("Room.findByAvailable");
            query.setParameter("available", checkAvailable);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public List<Room> searchByFloor1() {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNamedQuery("Room.searchByFloor1");
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public List<Room> searchByFloor2() {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNamedQuery("Room.searchByFloor2");
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public List<Room> searchByFloor3() {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNamedQuery("Room.searchByFloor3");
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public List<Room> searchByFloor4() {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNamedQuery("Room.searchByFloor4");
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public List<Room> searchByFloor5() {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNamedQuery("Room.searchByFloor5");
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public List<Room> searchByFloor6() {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNamedQuery("Room.searchByFloor6");
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public List<Room> searchByFloor7() {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNamedQuery("Room.searchByFloor7");
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public List<Room> searchByFloor8() {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNamedQuery("Room.searchByFloor8");
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public List<Room> findBySizeRoom(double sizeRoom) {
        EntityManager em = getEntityManager();
        try {
            String sizeroom1 = "";
            String sizeroom2 = "";
            if (sizeRoom >= 23.80 && sizeRoom <= 24.30) {
                sizeroom1 = "23";
                sizeroom2 = "25";
            }else if(sizeRoom >= 26.20 && sizeRoom <= 27.10){
                sizeroom1 = "26";
                sizeroom2 = "27";
            }else if(sizeRoom >= 34.30 && sizeRoom <= 35.00){
                sizeroom1 = "34";
                sizeroom2 = "35";
            }else{
                return null;
            }
            Query query = em.createNamedQuery("Room.findBySizeroom");
            query.setParameter("sizeroom1", sizeroom1 + "Sq.M");
            query.setParameter("sizeroom2", sizeroom2 + "Sq.M");
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public List<Room> findByTypeRoom(String typeRoom) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNamedQuery("Room.findByTyperoom");
            query.setParameter("typeroom", typeRoom);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public List<Room> findByPriceMoreThan(double price) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNamedQuery("Room.findByPriceMoreThan");
            query.setParameter("price", price);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public List<Room> findByPriceLessThan(double price) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNamedQuery("Room.findByPriceLessThan");
            query.setParameter("price", price);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public int getRoomCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Room> rt = cq.from(Room.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

}
