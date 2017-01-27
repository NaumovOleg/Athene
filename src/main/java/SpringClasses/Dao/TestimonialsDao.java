package SpringClasses.Dao;

import SpringClasses.Entety.Testimonials;
import SpringClasses.Entety.User;

import java.util.List;

public interface TestimonialsDao {
    public List<Testimonials> getAllTestimonials();
    public void addTstimonialToUser(Testimonials testimonials);
    public void removeTestimonialsFromUser(User user);

}
