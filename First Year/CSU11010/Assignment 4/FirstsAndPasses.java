/*  SELF ASSESSMENT of whether my code is easy to understand.
   1. Did I use easy-to-understand meaningful variable and constant names?
       Mark out of 10: 10  
       Comment: I tried my best to use names that were meaningful but not too long.
   2. Did I format the variable and constant names properly (in lowerCamelCase and UPPERCASE)?
       Mark out of 5: 5   
       Comment: I used lowerCamelCase on all variables, and UPPERCASE on all constants.
   3. Did I indent the code appropriately?
       Mark out of 10:   10
       Comment: I tried to indent the code in a way that makes the code easy to understand
   4. Did I implement a for loop to read the input as required?
       Mark out of 10: 10  
       Comment: I implemented a for loop to allow the user to input all students results and then a while loop in the forloop to make sure that each student had a valid percentage.
      Total Mark out of  35 (Add all the previous marks):  
*/
import java.util.Scanner;

public class FirstsAndPasses 
{
	public static void main(String[]args)
	{
		final double FIRST = 70.0;
		final double PASS = 40.0;
		
		double percentage = 0;
		int firstNr = 0;
		int passNr = 0;
		
		System.out.printf("Enter the number of students in the class> ");
		Scanner input = new Scanner(System.in);
		int numberOfStudents = input.nextInt();
		
		boolean isValidNr = (numberOfStudents > 0);
		
		
		if(isValidNr)
		{
			for(int studentNr = 1 ; studentNr <= numberOfStudents ; studentNr ++)
			{
				System.out.printf("%nEnter the percentage obtained by student " + studentNr + "> ");
				percentage = input.nextDouble();
				
				boolean isValidPercentage = (percentage >= 0.0 && percentage <= 100.0);
				
				if(isValidPercentage)
				{
					boolean isFirst = (percentage <= 100.0 && percentage >= FIRST);
					boolean isPass = (percentage < FIRST && percentage >= PASS);
					
					if(isFirst)
					{
						firstNr = firstNr + 1;
						passNr = passNr + 1;
					}
					if(isPass)
					{
						passNr = passNr + 1;
					}
					else
					{
						
					}
				}
				else
				{
					while(percentage < 0.0 || percentage > 100.0)
					{
						System.out.printf("%nInvalid percentage. Please enter the mark again for this student. %n%nEnter the percentage obtained by student %d> ", studentNr);
						percentage = input.nextDouble();
					}
					
					
				}
			}
			double percentagePass = (passNr * 100) / numberOfStudents;
			
			System.out.printf("%nIn this class of %d students, %d got a first class honour and %.1f%% passed the class", numberOfStudents, firstNr, percentagePass);
		}
		else
		{
			System.out.print("%nError: The number of students must be greater than 0");
		}
		
	}
			
}
