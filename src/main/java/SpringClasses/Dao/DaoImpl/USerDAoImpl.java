package SpringClasses.Dao.DaoImpl;

import SpringClasses.Dao.UserDao;
import SpringClasses.Entety.User;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository
public class USerDAoImpl implements UserDao {
    @PersistenceContext
    EntityManager entityManager;

    @Override
    @Transactional
    public void addUser(User user) {
        entityManager.persist(user);

    }

    @Override
    public User findUserByEmail(String mail) {
        User user = (User)
                entityManager.createQuery
                        ("select user from User as user where   user.email =:mails")
                        .setParameter("mails", mail)
                        .getSingleResult();
        return user;
    }
    @Transactional
public List<User> getList(String name){
   Query query= entityManager.createQuery("select user from User as user  where user.email=:kk");
     query.setParameter("kk",name)  ;
      List<User> list=  (List<User>) query.getResultList();
        return list;
}

    @Override
    @Transactional
    public void mergeUser(User user) {
        entityManager.merge(user);
    }

    @Override
    @Transactional
    public void editUser(User user) {
        entityManager.merge(user);
    }

    @Override
    @Transactional
    public List getAllUsers() {
       return entityManager.createQuery("select u from User as u ").getResultList();
    }

    @Override
    public User getUserById(int id) {
        String ides=String.valueOf(id);
        return(User ) entityManager.createQuery("select u from User as  u where u.id=:ide").setParameter("ide",id).getSingleResult();
    }

}
