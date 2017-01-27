package SpringClasses.Entety;

import SpringClasses.DataTranferObject.USerTRansfer;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
public class User  {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;
    @Column
    private String name;
    @Column
    private String username;
    @Column
    private String surname;
    @Column
    private String email;
    @Column
    private String password;
    @Column
    private Date dateOfregistration;
//    @Column
//    private boolean accountNonExpired ;
//    @Column
//    private boolean accountNonLocked ;
//    @Column
//    private boolean credentialsNonExpired ;
//    @Column
//    private boolean enabled ;
//    @Column
    private String role;
    @Transient
    private String confirmPassword;
@OneToMany(fetch = FetchType.EAGER, mappedBy = "user")
List<UserBlank> userBlank;

    @OneToMany(mappedBy = "user" ,fetch = FetchType.EAGER)
    private List<Testimonials> testimonial;

    @OneToMany(mappedBy = "user",fetch = FetchType.LAZY)
    private List<ChatClass> massages;

    public User(USerTRansfer uSerTRansfer) {
        this.name = uSerTRansfer.getName();
        this.email=uSerTRansfer.getEmail();
        this.password=uSerTRansfer.getPassword();
        this.phone=uSerTRansfer.getPhone();
        this.surname=uSerTRansfer.getSurname();

    }

    @Column
private String phone;

//    public UserBlank getUserBlank() {
//        return userBlank;
//    }
//
//    public void setUserBlank(UserBlank userBlank) {
//        this.userBlank = userBlank;
//    }


    public List<UserBlank> getUserBlank() {
        return userBlank;
    }

    public void setUserBlank(List<UserBlank> userBlank) {
        this.userBlank = userBlank;
    }

    public List<ChatClass> getMassages() {
        return massages;
    }

    public void setMassages(List<ChatClass> massages) {
        this.massages = massages;
    }

    public List<Testimonials> getTestimonial() {
        return testimonial;
    }

    public void setTestimonial(List<Testimonials> testimonial) {
        this.testimonial = testimonial;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

//    public void setAccountNonExpired(boolean accountNonExpired) {
//        this.accountNonExpired = accountNonExpired;
//    }

//    public void setAccountNonLocked(boolean accountNonLocked) {
//        this.accountNonLocked = accountNonLocked;
//    }

//    public void setCredentialsNonExpired(boolean credentialsNonExpired) {
//        this.credentialsNonExpired = credentialsNonExpired;
//    }

//    public void setEnabled(boolean enabled) {
//        this.enabled = enabled;
//    }

    public User() {
    }


    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getId() {
        return id;
    }
    public String getUsername() {
        return username;
    }

//    @Override
//    public boolean isAccountNonExpired() {
//        return true;
//    }
//
//    @Override
//    public boolean isAccountNonLocked() {
//        return true;
//    }
//
//    @Override
//    public boolean isCredentialsNonExpired() {
//        return true;
//    }
//
//    @Override
//    public boolean isEnabled() {
//        return true;
//    }

    public void setUsername(String login) {
        this.username = login;
    }

    public void setPassword(String password) {
        this.password = password;
    }

//    @Override
//    public Collection<? extends GrantedAuthority> getAuthorities() {
//        List<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>();
//        authorities.add(new SimpleGrantedAuthority("USER"));
//        return authorities;
//
//    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

//    @Override
    public String getPassword() {
        return password;
    }



    public Date getDateOfregistration() {
        return dateOfregistration;
    }

    public void setDateOfregistration(Date dateOfregistration) {
        this.dateOfregistration = dateOfregistration;
    }

}
