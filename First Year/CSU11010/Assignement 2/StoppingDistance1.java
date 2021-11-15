/*  SELF ASSESSMENT of whether my code is easy to understand.
   1. Did I use appropriate CONSTANTS instead of numbers within the code?
       Mark out of 5:  5   
       Comment:
   2. Did I use easy-to-understand, meaningful CONSTANT names?
       Mark out of 5:  5  
       Comment: 
   3. Did I format the CONSTANT names properly (in UPPERCASE)?
       Mark out of 5:  5
       Comment: 
   4. Did I use easy-to-understand meaningful variable names?
       Mark out of 10:  10  
       Comment: 
   5. Did I format the variable names properly (in lowerCamelCase)?
       Mark out of 5:  5 
       Comment: 
   6. Did I indent the code appropriately?
       Mark out of 10:  10
       Comment: 
     Total Mark out of  40 (Add all the previous marks): 40 
*/

import java.util.Scanner;

public class StoppingDistance1 {
	public static void main(String[]args)
	{
		
		double CONVERSION_FACTOR = 3.6;
		int BREAKING_CONSTANT = 20;
		System.out.print("Enter vehicle speed in km/hr> ");
		Scanner input = new Scanner(System.in);
		double speed = input.nextDouble();
		
		System.out.print("Enter reaction time in seconds> ");
		double reactionTime = input.nextDouble();
		
		input.close();
		
		double speedMeters = ( speed / CONVERSION_FACTOR );
		double reactionDistance = ( speedMeters * reactionTime ); //speed in metres per second times the reaction time in seconds
		double breakingDistance = ( (speedMeters * speedMeters ) / BREAKING_CONSTANT  );
		double stoppingDistance = ( reactionDistance + breakingDistance );

		System.out.printf("At a speed of %.1fkm/hr and with a reaction time of %.1fs, the stopping distance would be %.1fm", speed, reactionTime, stoppingDistance);
	}
}
