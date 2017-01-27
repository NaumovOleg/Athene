package SpringClasses.DataTranferObject;

import SpringClasses.Entety.User;


public class USerTRansfer {
    private String name;
    private String email;
    private String surname;
    private String phone;
    private String password;

    public USerTRansfer() {
    }

    public USerTRansfer(User user) {
        this.name = user.getName();
        this.email = user.getEmail();
        this.surname = user.getSurname();
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

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
