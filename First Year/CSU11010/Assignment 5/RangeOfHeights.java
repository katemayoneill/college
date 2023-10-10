import java.util.Scanner;

public class RangeOfHeights 
{
	public static void main(String[]args)
	{
		Scanner input = new Scanner(System.in);
		double currentHeight = 1.0;
		
		while(currentHeight != 0)
		{
			System.out.printf("%nEnter a height in metres (0.0 to finish)> ");
			currentHeight = input.nextDouble();
			double minimumHeight = currentHeight;
			double maximumHeight = minimumHeight;
			if(currentHeight > 0.0)
			{
				if(currentHeight < minimumHeight)
				{
					minimumHeight = currentHeight;
				}
				if(currentHeight > maximumHeight)
				{
					maximumHeight = currentHeight;
				}
			}
			if(currentHeight < 0.0)
			{
				System.out.printf("Negative heights are invalid.%n");			
			}
			System.out.printf("Heights entered so far are in the range %.2f to %.2f", minimumHeight, maximumHeight);
		}
		input.close();
	}


}
