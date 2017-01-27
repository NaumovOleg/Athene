package Dump_classes;

/**
 * Created by Олег on 20.12.2016.
 */
//@Entity
public class Phhoto {
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @Column
   private  int id;
//    @Column
    private String name;
//    @Column
    private  byte [] photo=new byte[1];
    public Phhoto() {
    }

    public int getId() {
        return id;
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

    public byte[] getPhoto() {
        return photo;
    }

    public void setPhoto(byte[] photo) {
        this.photo = photo;
    }
}
