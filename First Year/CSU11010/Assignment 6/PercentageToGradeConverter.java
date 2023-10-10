import java.util.Scanner;

public class PercentageToGradeConverter
{
	public static void main(String[] args)
	{
		Scanner input = new Scanner(System.in);
		int numberOfTens = 0;
		String grade = "a";
		String percentageInput = "a";

		do
		{
			System.out.print("Enter a percentage (or 'quit' to finish)>  ");
			percentageInput  = input.next();
			if(input.hasNextDouble())
			{
				double percentage = input.nextDouble();
				if(percentage >= 0.0 && percentage <= 100.0)
				{
					double percentageTest = percentage;
					for( numberOfTens = 0; percentageTest >= 0; numberOfTens++)
					{
						percentageTest -= 10;

					}
					switch(numberOfTens)
					{
					case 10:
					case 9:
					case 8:
					case 7:
						grade = "I";
						System.out.printf("The grade for %.1f%% is a %s", percentage, grade);
						break;
					case 6:
						grade = "II.1";
						System.out.printf("The grade for %.1f%% is a %s", percentage, grade);
						break;
					case 5:
						grade = "II.2";
						System.out.printf("The grade for %.1f%% is a %s", percentage, grade);
						break;
					case 4:
						grade = "III";
						System.out.printf("The grade for %.1f%% is a %s", percentage, grade);
					case 3:
					case 2:
					case 1:
						if(percentage >= 35.0)
						{
							grade = "F1";
							System.out.printf("The grade for %.1f%% is a %s", percentage, grade);
						}
						else
						{
							grade = "F2";
							System.out.printf("The grade for %.1f%% is a %s", percentage, grade);
						} 
						break;
					default:
						break;
					}
					
				}
				else
				{
					System.out.print("Error: Percentages must be between 0.0% and 100.0%");
				}
			}
			else
			{
				System.out.print("Error: Enter a number between 0.0 and 100.0, or the word quit to exit the program.");
			}
		}
		while(percentageInput != "quit");


	}
}
