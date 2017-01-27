package SpringClasses.Dao.DaoImpl;

import SpringClasses.Dao.TestimonialsDao;
import SpringClasses.Entety.Testimonials;
import SpringClasses.Entety.User;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;
@Repository
public class TestimonialsDaoImpl implements TestimonialsDao {
    @PersistenceContext
    EntityManager entityManager;


    @Override
    @Transactional
    public List<Testimonials>   getAllTestimonials() {
        return   entityManager.createQuery("select tests  from  Testimonials as tests").getResultList();
    }

    @Override
    @Transactional
    public void addTstimonialToUser(Testimonials testimonials) {
        entityManager.persist(testimonials);
    }

    @Override
    @Transactional
    public void removeTestimonialsFromUser(User user) {
        entityManager.createQuery("delete from Testimonials where user=:us").setParameter("us",user);

    }
}
