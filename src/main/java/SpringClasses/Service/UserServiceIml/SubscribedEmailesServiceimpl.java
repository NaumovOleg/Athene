package SpringClasses.Service.UserServiceIml;

import SpringClasses.Dao.SubscribedEnmailsDao;
import SpringClasses.Entety.SubscribedEmails;
import SpringClasses.Service.SubscribedEmailesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SubscribedEmailesServiceimpl implements SubscribedEmailesService {
    @Autowired
    SubscribedEnmailsDao subscribedEnmailsDao;
    @Override
    public boolean checkIfExistsThisMail(String mail) {
        return subscribedEnmailsDao.checkIfExistsThisMail(mail).isEmpty();
    }

    @Override
    public List<SubscribedEmails> getAllSubscribedemails() {
        return subscribedEnmailsDao.getAllSubscribedemails();
    }

    @Override
    public void addSubscribedemail(String mail) {
subscribedEnmailsDao.addSubscribedemail(mail);
    }
}
