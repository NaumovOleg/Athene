package SpringClasses.DataTranferObject;

import SpringClasses.Entety.Testimonials;

import java.util.Date;

/**
 * Created by Олег on 24.12.2016.
 */
public class TestimonialsTransfer {
  private  int id;
    private int user_id;
    private String testimonial;
    private Date date;
private String name;
    public TestimonialsTransfer(Testimonials testimonials) {
        this.name = testimonials.getUser().getName();
        this.user_id = testimonials.getUser().getId();
        this.testimonial = testimonials.getTestimonial();
        this.date = testimonials.getDate();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTestimonial() {
        return testimonial;
    }

    public void setTestimonial(String testimonial) {
        this.testimonial = testimonial;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getTstimonial() {
        return testimonial;
    }

    public void setTstimonial(String tstimonial) {
        this.testimonial = tstimonial;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
