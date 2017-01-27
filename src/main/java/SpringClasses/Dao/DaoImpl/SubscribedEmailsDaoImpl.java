package SpringClasses.Dao.DaoImpl;

import SpringClasses.Dao.SubscribedEnmailsDao;
import SpringClasses.Entety.SubscribedEmails;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;
@Repository
public class SubscribedEmailsDaoImpl implements SubscribedEnmailsDao{
    @PersistenceContext
    EntityManager entityManager;
    @Override
    @Transactional
    public List<SubscribedEmails> getAllSubscribedemails() {
        return entityManager.createQuery("select e.email from SubscribedEmails as e ").getResultList();
    }

    @Override
    @Transactional
    public void addSubscribedemail(String mail) {
        SubscribedEmails emails=new SubscribedEmails();
        emails.setEmail(mail);
        System.out.println(mail);
        System.out.println("dao-------------------------------------------------------------");
        entityManager.persist(emails);
    }

    @Override
    @Transactional
    public List<SubscribedEmails> checkIfExistsThisMail(String mail) {
        return(List<SubscribedEmails>) entityManager.createQuery("select u  from SubscribedEmails as u where u.email =:mass").setParameter("mass",mail).getResultList();
    }

}
