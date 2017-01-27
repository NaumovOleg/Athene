package SpringClasses.Entety;

import javax.persistence.*;

@Entity
public class Staff {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;
    @Column
    String PHP;
    @Column
    String JAVA;
    @Column
    String JS;
    @Column
    String DESIGNERS;

    public void  setStaff(Staff staff) {
        this.PHP = staff.getPHP();
        this.JAVA = staff.getJAVA();
        this.JS = staff.getJS();
        this.DESIGNERS = staff.getDESIGNERS();
    }

    public Staff() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPHP() {
        return PHP;
    }

    public void setPHP(String PHP) {
        this.PHP = PHP;
    }

    public String getJAVA() {
        return JAVA;
    }

    public void setJAVA(String JAVA) {
        this.JAVA = JAVA;
    }

    public String getJS() {
        return JS;
    }

    public void setJS(String JS) {
        this.JS = JS;
    }


    public String getDESIGNERS() {
        return DESIGNERS;
    }

    public void setDESIGNERS(String DESIGNERS) {
        this.DESIGNERS = DESIGNERS;
    }

}
