package SpringClasses.Service.UserServiceIml;

import SpringClasses.Dao.EmailSDao;
import SpringClasses.Service.EmailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class EmailsServiceImpl implements EmailsService {
    @Autowired
    EmailSDao emailSDao;
    @Override
    public List<String> getAllAmails() {
        return emailSDao.getAllMails();
    }

    @Override
    public List<String> checkEmaiIfExists(String mail) {
        return emailSDao.checkEmaiIfExists(mail);
    }

    @Override
    public List<String> getAllUsersEmails() {
        return emailSDao.getAllUsersEmails();
    }
}
