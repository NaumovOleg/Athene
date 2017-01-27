package Dump_classes;

import org.springframework.web.multipart.MultipartFile;

/**
 * Created by Олег on 13.12.2016.
 */
public interface FileClass {
    public void saveImage( MultipartFile multipartFile);
}
