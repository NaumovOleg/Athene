package Dump_classes.ValiUSer;

import SpringClasses.Entety.User;
import SpringClasses.Service.EmailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
@Component
public class ValidationWithException {
    @Autowired
    EmailsService emailsService;
    Matcher matcher;
    Pattern pattern = Pattern.compile
            ("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@\" +\n" +
                    "                    \"[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
    public String validateUser(User user) {
        try {

            if (!user.getPassword().equals(user.getConfirmPassword())) {
                throw new MyException("password does not mathes");
            }
            if (user.getPassword().equals("")) {
                throw new MyException("please enter password");
            }

            if (user.getEmail().equals("")) {
                throw new MyException("please enter email");
            }


            List<String> emails=emailsService.getAllAmails();
            for (String email : emails) {
                if (user.getEmail().equals(email)) {
                    throw new MyException("this email is olready registered");
                }
            }

            if (!(matcher = pattern.matcher(user.getEmail())).matches()) {
                throw new MyException("Please enter correct email");
            }


        } catch (MyException e) {
            return e.getMessage();
        }


        try{
            if (user.getName().equals("")) {
                throw new MyException("please enter Your name");
            }
        }catch (MyException e) {
            return e.getMessage();
        }
        return "";
    }
}
