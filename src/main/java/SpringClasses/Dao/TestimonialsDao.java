package SpringClasses.Dao;

import SpringClasses.Entety.Testimonials;
import SpringClasses.Entety.User;

import java.util.List;

/**
 * Created by Олег on 20.12.2016.
 */
public interface TestimonialsDao {
    public List<Testimonials> getAllTestimonials();
    public void addTstimonialToUser(Testimonials testimonials);
    public void removeTestimonialsFromUser(User user);

}
