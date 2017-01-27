package SpringClasses.Service.UserServiceIml;

import SpringClasses.Dao.TestimData;
import SpringClasses.Dao.TestimonialsDao;
import SpringClasses.Dao.UserDao;
import SpringClasses.Entety.Testimonials;
import SpringClasses.Entety.User;
import SpringClasses.Service.TestimonialsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
@Service
public class TestimonialsServiceImpl implements TestimonialsService {
    @Autowired
    UserDao userDao;
    @Autowired
    TestimonialsDao testimonialsDao;
    @Autowired
    TestimData data;
    @Override
    public void addTestimonial(String testimonial,String email) {
        Testimonials testim=new Testimonials();
        testim.setDate(new Date());
        testim.setTestimonial(testimonial);
        User user=userDao.findUserByEmail(email);
        testim.setUser(user);
        testimonialsDao.addTstimonialToUser(testim);
    }

    @Override

    public List<Testimonials> getAllTestimonials() {
        return testimonialsDao.getAllTestimonials();
    }

    @Override
    public void removeTestimonFromUser(String user) {

        testimonialsDao.removeTestimonialsFromUser(userDao.findUserByEmail(user));
    }
}
