package SpringClasses.Dao.DaoImpl;

import SpringClasses.Dao.ChatDao;
import SpringClasses.Entety.ChatClass;
import SpringClasses.Entety.User;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
public class ChatDaoIml implements ChatDao {


    @PersistenceContext
    private
    EntityManager entityManager;

    @Override
    @SuppressWarnings(value = "getUsersMassages")
    @Transactional
    public List<ChatClass> getUsersMassages(int  user) {

        return
                entityManager.createQuery("select mas from ChatClass as mas inner join User as u on mas.user.id=u.id where u.id=:us")
                .setParameter("us", user).getResultList();
    }

    @Override
    @Transactional
    public void addMassage(ChatClass mas) {
        entityManager.persist(mas);
    }

    @Override
    @Transactional
    public void deleteMassageFromUserPage(ChatClass mas) {
        entityManager.merge(mas);

    }

    @Override
    @Transactional
    public void deleteMassageFromBase(ChatClass mas) {
        entityManager.remove(mas);
    }

    @Override
    @Transactional
    public ChatClass getMassageById(int id) {
        return (ChatClass) entityManager.createQuery("select mas from ChatClass  as mas where mas.id=:ide").setParameter("ide", id).getSingleResult();
    }


    @Override
    @Transactional
    public void setReadedMassageByUser(User user) {
        entityManager.createQuery("update ChatClass as mass  set mass.readedByUser=:truee where mass.user=:us").
                setParameter("truee", true).
                setParameter("us", user).
                executeUpdate();
    }

    @Override
    @Transactional
    public void SetReadedByUs() {
        entityManager.createQuery("update ChatClass as mass  set mass.readedByUs=:truee where mass.user=:us").
                setParameter("truee", true).
                executeUpdate();
    }

    @Override
    @Transactional

    public int countOfUsersNewMassages(User user) {
        System.out.println("get sise==================================================================");
        List <String > list= entityManager.createQuery
                ("select massage from ChatClass where user.id =:use and readedByUser=:read").
                setParameter("use", user.getId()).setParameter("read", false).getResultList();
        System.out.println("get 2 size==========================================================");
        return list.size();
    }

    @Override
    @Transactional
    public void addMassageFromUsToUser(ChatClass massage) {
        entityManager.persist(massage);
    }
}
