package SpringClasses.Entety;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
public class Testimonials implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column
    private Date date;
    @Column(columnDefinition = "TEXT")
    private String testimonial;

    @ManyToOne(fetch = FetchType.EAGER)
    private User user;

    public Testimonials() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getTestimonial() {
        return testimonial;
    }

    public void setTestimonial(String testimonial) {
        this.testimonial = testimonial;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

}
