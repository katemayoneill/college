import java.io.*;  
import java.util.Scanner;

public class DirList
{  
    public static void ls(String dir) throws Exception
    {
        File f = new File(dir);  
        String filenames[] = f.list();  

        for(String filename:filenames)
	{  
            System.out.println(filename);  
        }  
    }

    public static void main(String[] args) throws Exception
    {  
	System.out.print("Enter name of directory: ");
	Scanner input = new Scanner(System.in);
	String dirName = input.next();
	ls(dirName);
    }  
}  