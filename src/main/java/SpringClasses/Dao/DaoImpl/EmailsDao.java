package SpringClasses.Dao.DaoImpl;

import SpringClasses.Dao.EmailSDao;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
public class EmailsDao implements EmailSDao {

    @PersistenceContext
    EntityManager entityManager;

    @Override
    @Transactional
    public List<String> getAllMails() {
        return entityManager.createQuery("select email from User ").getResultList();
    }

    @Override
    @Transactional
    public List<String> checkEmaiIfExists(String mail) {
        List<String> maila = (List<String>)entityManager.createQuery("select email as email from User as us  where us.email =:checkedMail").
                        setParameter("checkedMail", mail).getResultList();
        return maila;

    }

    @Override
    public List<String> getAllUsersEmails() {
        return entityManager.createQuery("select u.email from User as u ").getResultList();
    }
}
