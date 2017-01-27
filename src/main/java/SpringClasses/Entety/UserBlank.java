package SpringClasses.Entety;

import javax.persistence.*;

@Entity
public class UserBlank {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  int id;
    @ManyToOne(fetch = FetchType.EAGER)
    private  User user;
    @Column
   private String redyPercent;
    @Column
    private  String projectNamae;
    @Column
    private  String projectInfo;

    public String getProjectNamae() {
        return projectNamae;
    }

    public void setProjectNamae(String projectNamae) {
        this.projectNamae = projectNamae;
    }

    public String getProjectInfo() {
        return projectInfo;
    }

    public void setProjectInfo(String projectInfo) {
        this.projectInfo = projectInfo;
    }

    public UserBlank() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getRedyPercent() {
        return redyPercent;
    }

    public void setRedyPercent(String redyPercent) {
        this.redyPercent = redyPercent;
    }


}
