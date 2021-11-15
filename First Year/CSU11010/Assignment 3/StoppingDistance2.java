/*  SELF ASSESSMENT of whether my code is easy to understand.
   1. Did I use easy-to-understand meaningful variable and constant names?
       Mark out of 15:  15 
       Comment: I tried to use names that were easy to understand, hopefully all is well
   2. Did I format the variable and constant names properly?
       Mark out of 5:   5
       Comment: used camel case for variables and all caps for constants
   3. Did I indent the code appropriately?
       Mark out of 10:   10
       Comment: indented the code so that it would be easier to understand
      Total Mark out of  30 (Add all the previous marks):  30
*/

/*
Assume that the reaction time of the driver (in seconds) is 2.0 seconds if the driver is less than 50 years old, is 2.5 seconds if the driver is between 50 and 59 years old, and is 3.0 seconds if the driver is 60 or older.
The braking distance is the square of the speed of the vehicle (in kilometres per hour) divided by 250 times the coefficient of friction.
You may assume that the vehicle is travelling on a tarmac road and that the coefficient of friction for a tarmac road is 0.8 if the road is dry and 0.4 if the road is wet.
The stopping distance is to be computed as the sum of the reaction distance (which is the speed in metres per second times the reaction time in seconds) and the braking distance.
You must use exactly the same formatting (language, spacing, etc.) as shown in the expected input/output is shown below.

 */

import java.util.Scanner;

public class StoppingDistance2 {
	public static void main(String[]args)
	{
		
		final double  CONVERSION_FACTOR = 3.6;
		final double FRICTION_DRY = 0.8;
		final double FRICTION_WET = 0.4;
				
		
		System.out.print("Enter vehicle speed in km/hr> ");
		Scanner input = new Scanner(System.in);
		double speed = input.nextDouble();
		
		System.out.print("Enter age in years> ");
		int ageAnswer = input.nextInt();
		
		System.out.print("Is the road wet (Yes/No)? ");
		String isRoadWetAnswer = input.next();
		input.close();
		
		double reactionTime = 0;
		double frictionCoefficient = 0;
		String roadWetOrDry = "Yes";
				
		boolean isUnderFifty = (ageAnswer < 50);
		boolean isUnderSixty = (ageAnswer >= 50) && (ageAnswer <60);
		boolean isOverSixty = (ageAnswer >= 60);
		boolean RoadIsWet = isRoadWetAnswer.equalsIgnoreCase("Yes");
		
		if (isUnderFifty)
		{
			reactionTime  = 2.0;
		}
		
		if (isUnderSixty)
		{
			reactionTime = 2.5;
		}
		
		if  (isOverSixty)
		{
			reactionTime = 3.0;
		}
		
		if (RoadIsWet)
		{
			frictionCoefficient = FRICTION_WET;
			roadWetOrDry = "wet";
		}
		else
		{
			frictionCoefficient = FRICTION_DRY;
			roadWetOrDry = "dry";
		}
		
		double speedMeters = ( speed / CONVERSION_FACTOR );
		double reactionDistance = (speedMeters * reactionTime );
		double breakingDistance = ( (speed * speed ) / (250 * frictionCoefficient) );
		double stoppingDistance = ( reactionDistance + breakingDistance );

		System.out.printf("As the road is %s, the coefficient of friction is %.1f %nAs the driver is %d years old, his/her reaction time is %.1fs %nAt a speed of %.1f km/hr, the reaction distance is %.0fm, the braking distance is %.0fm, and so the stopping distance is %.0fm", roadWetOrDry, frictionCoefficient, ageAnswer, reactionTime, speed, reactionDistance, breakingDistance, stoppingDistance);
		
	}
}
