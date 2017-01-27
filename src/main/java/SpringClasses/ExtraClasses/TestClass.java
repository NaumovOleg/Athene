package SpringClasses.ExtraClasses;

import org.springframework.web.multipart.MultipartFile;

/**
 * Created by Олег on 05.01.2017.
 */
public class TestClass {

    private String name;
//    private byte[] file;
private MultipartFile file;
    public TestClass(String name, MultipartFile  file) {
        this.name = name;
        this.file = file;
    }

    public TestClass() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

//    public byte[] getFile() {
//        return file;
//    }
//
//    public void setFile(byte[] file) {
//        this.file = file;
//    }
}
