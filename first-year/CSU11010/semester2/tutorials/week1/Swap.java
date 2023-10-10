import java.util.Scanner;

public class Swap { 
  
    public static void main(String[] args) 
    { 
	Scanner input = new Scanner(System.in);

        System.out.print("Enter first number: ");
        int x = input.nextInt(); 

        System.out.print("Enter second number: ");
        int y = input.nextInt(); 

        x = x + y; 
        y = x - y; 
        x = x - y; 

        System.out.println("After swaping:" + " x = " + x + ", y = " + y); 
    } 
} 