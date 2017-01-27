package SpringClasses.StructureFiles;

import SpringClasses.Entety.User;
import SpringClasses.ExtraClasses.ContactUs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class SendingManager {
    @Autowired
    MAil mail;

    public void sendMailAfterRegistrationToUser(User user) {
        String body = "Hello dear " + user.getName() + " . " +
                "Your registration was succesfull  \n " +
                "We are happy to see You at our website \n " +
                "Your credentials: \n " +
                "login: " + user.getEmail() + "\n" +
                "password: " + user.getPassword()+" \n+"+"" +
                "Please open our web-site and sign up with your credentials" ;
        mail.sendMail("Athene", body, user.getEmail());
    }
    public void contactUs(ContactUs contact){
        mail.sendMail(contact.getEmail()+"----"+contact.getName(), contact.getText(), "athene.lviv@gmail.com");
    }

//    public void sendThatUserWasRegistered(User user){
//        mail.sendMail("Registration",user.getName()+"  :  "+user.getEmail(),"athene.lviv@gmail.com");
//    }
    public void someoneHaveSubscribed(String mail){
        this.mail.sendMail("Subscribed email",mail,"athene.lviv@gmail.com");
    }

    public void sendMailaboutaccomplishProject(String name ,String Email,String projectName){

        String body="Hello Dear "+name+"\n"+"We are happy to inform You that your project ( "+projectName+" ) is finished  " +
                "You can contact us on email or phone . \n Athene..  Best Regards";
        mail.sendMail("informaition from Athene",body,Email);

    }
}
