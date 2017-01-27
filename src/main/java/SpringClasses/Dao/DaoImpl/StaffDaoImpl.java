package SpringClasses.Dao.DaoImpl;

import SpringClasses.Dao.StaffDao;
import SpringClasses.Entety.Staff;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
public class StaffDaoImpl implements StaffDao {
    @PersistenceContext
    EntityManager entityManager;
    @Override
    @Transactional
    public void setStaff(Staff staff) {
        entityManager.merge(staff);
    }

    @Override
    @Transactional
    public Staff getStaff() {
        return (Staff) entityManager.createQuery("select st from Staff as st").getSingleResult();
    }

    @Override
    @Transactional
    public void addStaff(Staff staff) {
        entityManager.persist(staff);
    }
}
