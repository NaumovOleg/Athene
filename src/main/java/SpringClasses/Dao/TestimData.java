package SpringClasses.Dao;

import SpringClasses.Entety.Testimonials;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TestimData extends JpaRepository<Testimonials,Integer> {
}
