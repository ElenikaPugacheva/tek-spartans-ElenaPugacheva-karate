package data;

public class GenerateData {
    public static String getEmail(){
        int random = (int)(Math.random()*100);
        return "lehaim"+random+"@gmail.com";
    }
}
