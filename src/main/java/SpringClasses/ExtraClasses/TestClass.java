package SpringClasses.ExtraClasses;

import org.springframework.web.multipart.MultipartFile;

public class TestClass {

    private String name;

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

}
