package SpringClasses.Dao.DaoImpl;

import SpringClasses.Dao.UserDao;
import SpringClasses.Dao.UsersBlankDao;
import SpringClasses.Entety.UserBlank;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;
@Repository
public class UsersBlankDaoImpl implements UsersBlankDao{
    @PersistenceContext
    EntityManager entityManager;

    @Autowired
    UserDao userDao;
    @Override
    @Transactional
    public void addBlank(UserBlank blank) {
        entityManager.persist(blank);
    }

    @Override
    @Transactional
    public List<UserBlank> getUsersBlankByUsersEmai(String emaila) {
        System.out.println("Dao UserBlank---------------------------------------------------------");
        return entityManager.createQuery("select userblank from UserBlank  " +
                "as userblank inner join User as u on userblank.user.id=u.id " +
                "where u.email=:em").setParameter("em",emaila).getResultList();
    }

    @Override
    @Transactional
    public void editUserBlank(UserBlank userBlank) {
        entityManager.persist(userBlank);
    }

    @Override
    @Transactional
    public void setAccomplishProject(int id) {

        entityManager.createQuery("update UserBlank as userBlank  set userBlank.redyPercent=:fin where userBlank.id=:use").
                setParameter("fin","Accomplish").setParameter("use", id).executeUpdate();
    }

    @Override
    @Transactional
    public List<UserBlank> getUsersBlankByUserId(int id) {
         return entityManager.createQuery("select userblank from UserBlank  " +
                "as userblank inner join User as u on userblank.user.id=u.id " +
                "where u.id=:em").setParameter("em",id).getResultList();
    }

    @Override
    @Transactional
    public String blankNameByBlankId(int ide) {
        return (String)entityManager.createQuery("select blank.projectNamae from UserBlank as blank where blank.id=:i").setParameter("i",ide).getSingleResult();
    }


}
