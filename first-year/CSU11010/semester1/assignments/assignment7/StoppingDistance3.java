/*  SELF ASSESSMENT of whether my code is easy to understand.
   1. Did I use easy-to-understand meaningful and properly formatted variable names and constants?
       Mark out of 5:   5
       Comment: i tried my best to use constant names that are as easy to understand as possible, 
       i used lowerCamelCase for variables and all caps for constants.
    2. Did I indent the code appropriately?
       Mark out of 5:  5 
       Comment: i tried to indent the code properly in order to make the code as easy to understand as possible.
   3. Did I make use of the functions appropriately within main and the other functions?
       Mark out of 5:  5 
       Comment: i created all of the functions required, and used them in my output.
   4. Have I avoided inappropriate duplication of code?
       Mark out of 5:   5
       Comment: i avoided duplicating code as much a possible.
     Total Mark out of  20 (Add all the previous marks):  20 
 */


import java.util.Scanner;

public class StoppingDistance3 
{
	public static final double  DRY_ROAD_COEFFICIENT = 0.8;
	public static final double WET_ROAD_COEFFICIENT = 0.4;
	public static final double ICY_ROAD_COEFFICIENT = 0.1;
	public static final double CONVERSION_CONSTANT = 3.6;
	public static double brakingDistance = 0.0;
	public static double coefficientOfFriction = 0.0;
	public static double reactionDistance = 0.0;
	public static double stoppingDistanceDouble = 0.0;
	public static double stoppingDistance = 0.0;

	public static void main(String[]args) 
	{
		Scanner input = new Scanner(System.in);
		System.out.print("Enter vehicle speed in km/hr> ");
		double vehicleSpeed = input.nextDouble();
		System.out.print("Enter age in years> ");
		int age = input.nextInt();
		System.out.print("Is the road wet (Yes/No)? ");
		String isRoadWetAnswer = input.next();
		System.out.print("Is the road icy (Yes/No)? ");
		String isRoadIcyAnswer = input.next();

		boolean roadIsWet = isRoadWetAnswer.equalsIgnoreCase("Yes");
		boolean roadIsIcy = isRoadIcyAnswer.equalsIgnoreCase("Yes");

		String roadCondition = ("");
		if(roadIsIcy && roadIsWet)
		{
			roadCondition = ("icy and wet");
		}
		else if(roadIsIcy)
		{
			roadCondition = ("icy and dry");
		}
		else if(roadIsWet)
		{
			roadCondition = ("wet");
		}
		else
		{
			roadCondition = ("dry");
		}
		System.out.printf("As the road is %s, the coefficient of friction is %.1f%nAt a speed of %.1fkm/hr, a driver who is %d years old, the reaction distance is %.0fm, the braking distance is %.0fm, and so the stopping distance is %dm"
				, roadCondition, computeCoefficientOfFriction(roadIsIcy, roadIsWet), vehicleSpeed, age, computeReactionDistance(vehicleSpeed, age), computeBrakingDistance(vehicleSpeed, roadIsIcy, roadIsWet), 
				computeStoppingDistance(vehicleSpeed, age, roadIsIcy, roadIsWet));
		input.close();
	}

	public static double computeCoefficientOfFriction(boolean roadIsIcy, boolean roadIsWet)
	{
		if(roadIsIcy)
		{
			coefficientOfFriction = ICY_ROAD_COEFFICIENT;
		}
		else if(roadIsWet) 
		{
			coefficientOfFriction = WET_ROAD_COEFFICIENT;
		}
		else
		{
			coefficientOfFriction = DRY_ROAD_COEFFICIENT;
		}
		return coefficientOfFriction;
	}
	public static double computeBrakingDistance(double vehicleSpeed, boolean roadIsIcy, boolean roadIsWet)
	{
		brakingDistance = (vehicleSpeed * vehicleSpeed) / (250 * computeCoefficientOfFriction(roadIsIcy, roadIsWet));
		return brakingDistance;
	}
	public static double computeReactionDistance(double vehicleSpeed, int age)
	{
		reactionDistance = (vehicleSpeed / CONVERSION_CONSTANT) * (1.0 + Math.abs(age - 24) * 0.05);
		return reactionDistance;
	}
	public static int computeStoppingDistance(double vehicleSpeed, int age, boolean roadIsIcy, boolean roadIsWet)
	{
		stoppingDistance = computeBrakingDistance(vehicleSpeed, roadIsIcy, roadIsWet) + computeReactionDistance(vehicleSpeed, age);
		return (int)Math.round(stoppingDistance);
	}

}
