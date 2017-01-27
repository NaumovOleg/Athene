package SpringClasses.ExtraClasses;

/**
 * Created by Олег on 05.01.2017.
 */
public class ContactUs {
    private String name;
    private String email;
    private String text;

    public ContactUs(String name, String email, String text) {
        this.name = name;
        this.email = email;
        this.text = text;
    }

    public ContactUs() {

    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
