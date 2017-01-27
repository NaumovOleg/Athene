package SpringClasses.Entety;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
//@JsonIgnoreProperties(ignoreUnknown=true)
public class SubscribedEmails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String email;

    public SubscribedEmails() {
    }

    public SubscribedEmails(String email) {
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof SubscribedEmails)) return false;

        SubscribedEmails emails = (SubscribedEmails) o;

        if (getId() != emails.getId()) return false;
        return getEmail().equals(emails.getEmail());

    }

    @Override
    public int hashCode() {
        int result = getId();
        result = 31 * result + getEmail().hashCode();
        return result;
    }
}
