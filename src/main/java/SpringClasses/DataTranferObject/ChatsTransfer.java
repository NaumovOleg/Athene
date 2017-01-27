package SpringClasses.DataTranferObject;

import SpringClasses.Entety.ChatClass;

import java.util.Date;
public class ChatsTransfer {
    private int id ;
    private String massage;
    private Date date;
    private String  userId;

    public ChatsTransfer(ChatClass chatClass) {
        this.id = chatClass.getId();
        this.massage = chatClass.getMassage();
        this.date = chatClass.getDate();
        userId = String.valueOf(chatClass.getUser().getId());
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

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        userId = userId;
    }
}
