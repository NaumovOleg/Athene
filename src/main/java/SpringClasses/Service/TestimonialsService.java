package SpringClasses.Service;

import SpringClasses.Entety.Testimonials;

import java.util.List;

/**
 * Created by Олег on 20.12.2016.
 */
public interface TestimonialsService {
    public void addTestimonial(String testimonial,String email);
    public List<Testimonials> getAllTestimonials();
    public void removeTestimonFromUser(String user);
}
