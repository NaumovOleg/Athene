package SpringClasses.Dao.DaoImpl;

import SpringClasses.Dao.writePhoto;
import Dump_classes.Phhoto;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
public class writrePhotoImpl  implements writePhoto {
    @PersistenceContext
    EntityManager entityManager;
    @Override
    @Transactional
    public void write(byte[] photo) {

        Phhoto phhoto=new Phhoto();
        phhoto.setPhoto(photo);
        entityManager.persist(phhoto);
    }
}
