import java.util.Scanner;
import java.lang.Math;

/*
Write a program (and call the class MarksRemapper, and the file MarksRemapper.java) which takes any number of percentages from the user on a single line, and changes remaps these percentages so that the average is 60.0% and the standard deviation is 20.0%.    
Note that if any marks go below 0.0 or above 100.0 they should be set to 0.0 or 100.0 respectively (although this will change the average and standard deviation somewhat).  Output should be as shown in the examples.
As part of your program you must write and make use of the following functions:
public static double determineAverage( double[] arrayOfNumbers )  This routine should determine the average of all the numbers in the passed array (or 0.0 if the array is empty).
public static double determineStandardDeviation( double[] arrayOfNumbers, double average )  This routine should determine the standard deviation of all the numbers in the passed array (or 0.0 if the array is empty), given the passed value for the average.
public static boolean modifyAllMarks( double[] arrayOfMarks, double desiredAverage, double desiredStandardDeviation )  This routine should remap the marks in the passed array so that the average and standard deviation of the values become the passed average and standard deviation.  The routine should return whether or not this was possible.  Note that where the array has a range of values the new marks should be computed using the following formula:
NewMark = DesiredAverage + (OldMark - OldAverage)*DesiredStandardDeviation/OldStandardDeviation
 */

public class MarksRemapper 
{
	public static double average = 0.0;
	public static double standardDeviation = 0.0;
	public static double total = 0.0;
	public static double desiredAverage = 0.0;
	public static double desiredStandardDeviation = 0.0;
	public static boolean isPossible = true;
	public static boolean finished = false;

	public static double[] arrayOfNumbers;
	public static double[] arrayOfMarks;
	public static void main(String[]args)
	{
		
		System.out.print("Enter all percentages (separated by spaces): ");
	
		Scanner input = new Scanner(System.in);
		while(!finished) 
		{

			if(input.hasNextDouble()) {
				double[] newArray = new double[(arrayOfMarks==null)? 1 :arrayOfMarks.length+1];

				if (arrayOfMarks != null) {

					System.arraycopy( arrayOfMarks,0,newArray,0,arrayOfMarks.length );
				}
				newArray[newArray.length-1] = input.nextDouble();
				arrayOfMarks = newArray;
			}
			else 
			{
				break;
			}
		}
		arrayOfNumbers = arrayOfMarks;
		input.close();
	}
	public static double determineAverage( double[] arrayOfNumbers )
	{
		double total = 0.0;
		if(arrayOfNumbers == null)
		{
			average = 0.0;
		}
		else
		{
			for(int count = 0; count < arrayOfNumbers.length; count++)
			{
				total += arrayOfNumbers[count];
			}
			average = total / arrayOfNumbers.length;

		}
		return average;
	}
	public static double determineStandardDeviation( double[] arrayOfNumbers, double average )  //This routine should determine the standard deviation of all the numbers in the passed array (or 0.0 if the array is empty), given the passed value for the average.
	{
		if(arrayOfNumbers == null)
		{
			standardDeviation = 0.0;
		}
		else
		{
			double sum = 0;
			for(int counter = 0; counter < arrayOfNumbers.length; counter ++)
			{
				double value = arrayOfNumbers[counter];
				double squaredPart = Math.pow((value - average), 2);
				sum += squaredPart;
			}
			double sqrt = sum/(arrayOfNumbers.length);
			standardDeviation = Math.sqrt(sqrt);
		}
		return standardDeviation;
	}
	public static boolean modifyAllMarks( double[] arrayOfMarks, double desiredAverage, double desiredStandardDeviation )  //This routine should remap the marks in the passed array so that the average and standard deviation of the values become the passed average and standard deviation.  The routine should return whether or not this was possible.  Note that where the array has a range of values the new marks should be computed using the following formula: NewMark = DesiredAverage + (OldMark - OldAverage)*DesiredStandardDeviation/OldStandardDeviation
	{
		return isPossible;
	}

}
