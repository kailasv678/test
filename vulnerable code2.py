import java.io.File;
import java.io.IOException;

public class FileHandler {

    public void deleteFile(String fileName) {
        File file = new File(fileName);
        if (file.exists()) {
            try {
                file.delete();
                System.out.println("File deleted successfully.");
            } catch (Exception e) {
                System.err.println("Error deleting file: " + e.getMessage());
            }
        } else {
            System.out.println("File does not exist.");
        }
    }

    public static void main(String[] args) {
        FileHandler handler = new FileHandler();
        handler.deleteFile("/path/to/importantFile.txt");
    }
}
