package SpringClasses.Entety;

import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.Date;

@Entity
public class ChatClass {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column
    private String massage;
    @Column
    private Date date;
    @Column
    private String direct;

    @Type(type = "yes_no")
    @Column
    private boolean readedByUser;
    @Column
    private boolean readedByUs;
    @ManyToOne(fetch = FetchType.EAGER)
    private User user;



    public ChatClass() {
    }

    public ChatClass(String massage, Date date, String direct, boolean readedByUser, boolean readedByUs, User user) {
        this.massage = massage;
        this.date = date;
        this.direct = direct;
        this.readedByUser = readedByUser;
        this.readedByUs = readedByUs;
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMassage() {
        return massage;
    }

    public void setMassage(String massage) {
        this.massage = massage;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDirect() {
        return direct;
    }

    public void setDirect(String direct) {
        this.direct = direct;
    }

    public Boolean isReadedByUser() {
        return readedByUser;
    }

    public void setReadedByUser(boolean readedByUser) {
        this.readedByUser = readedByUser;
    }

    public boolean isReadedByUs() {
        return readedByUs;
    }

    public void setReadedByUs(boolean readedByUs) {
        this.readedByUs = readedByUs;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
