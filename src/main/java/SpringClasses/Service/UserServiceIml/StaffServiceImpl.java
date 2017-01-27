package SpringClasses.Service.UserServiceIml;

import SpringClasses.Dao.StaffDao;
import SpringClasses.Entety.Staff;
import SpringClasses.Service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

@Service
public class StaffServiceImpl implements StaffService {
    @Autowired
    StaffDao staffDao;
    @Override
    public void addOrsetStaff(Staff staff) {
        Staff st=null;
        try{
            st=staffDao.getStaff();
            st.setStaff(staff);
            staffDao.setStaff(st);
        }
        catch (EmptyResultDataAccessException e){
            staffDao.addStaff(staff);
        }

    }

    @Override
    public Staff getStaff() {
        return staffDao.getStaff();
    }
}
