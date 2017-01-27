package Dump_classes.ValiUSer;

import SpringClasses.Entety.User;
import SpringClasses.Service.EmailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Component
public class UserValidator implements Validator {
    @Autowired
    EmailsService emailsService;
    Pattern pattern = Pattern.compile
            ("(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"" +
                    "(?:[\\x01-\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-" +
                    "\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)" +
                    "+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]" +
                    "?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\" +
                    "x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f]" +
                    ")+)\\])");


    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user = (User) o;

//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "name.empty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "bad.email");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "password.empty");
        if (!user.getConfirmPassword().equals(user.getPassword())) {
            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirmPassword", "password.doesnotmath");
        }

        boolean passwordSwitcher = true;

        if (user.getPassword().length() < 2) {
            errors.rejectValue("password", "password.too.short");
            passwordSwitcher = false;
        }
        Matcher matcher;
        List<String> massages = emailsService.getAllAmails();
        for (String massage : massages) {
            if (massage.equals(user.getEmail())) {
                errors.rejectValue("email", "bad.email");
            }
        }
        if (!(matcher = pattern.matcher(user.getEmail())).matches()) {
            errors.rejectValue("email", "bad.email");
        }
    }
}
