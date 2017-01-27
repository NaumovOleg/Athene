package Dump_classes;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
/**
 * Created by Олег on 13.12.2016.
 */
@Service
public class FieClassImpl implements FileClass {

    @Transactional
    public void saveImage( MultipartFile multipartFile) {



        String path = System.getProperty("catalina.home") + "/resources/images/"+ multipartFile.getOriginalFilename();



        File file = new File(path);

        try {
            file.mkdirs();
            try {
                FileUtils.cleanDirectory
                        (new File(System.getProperty("catalina.home") + "/resources/images/"  + "/"));
            } catch (IOException e) {
                e.printStackTrace();
            }
            multipartFile.transferTo(file);
        } catch (IOException e) {
            System.out.println("error with file");
        }
    }
}
