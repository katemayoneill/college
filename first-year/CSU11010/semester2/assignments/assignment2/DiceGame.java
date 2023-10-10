/* SELF ASSESSMENT

1. ResolveBet
I have correctly defined ResolveBet which takes the bet type (String) and the Wallet object, and a void return type [Mark out of 7: 7 ].
Comment:  yes
My program presents the amount of cash in the wallet and asks the user how much he/she would like to bet [Mark out of 8:8 ].
Comment:yes
My program ensures the bet amount is not greater than the cash in the wallet [Mark out of 5:5 ].
Comment: yes and makes you start again
My program creates three Dice objects, rolls them and creates a total variable with a summation of the roll values returned [Mark out of 15:15 ]..
Comment:yes, uses it in if statements
My program determines the winnings by comparing the bet type with the total and comparing the bet type with the dice faces for the triple bet [Mark out of 20:20 ].
Comment:yes
My program outputs the results (win or loss) and adds the winnings to the wallet if user wins or removes the bet amount from the wallet if the user loses [Mark out of 10:10 ].
Comment:yes

2. Main
I ask the user for the amount of cash he/she has, create a Wallet object and put this cash into it [Mark out of 15:15 ]
Comment: yes
My program loops continuously until the user either enters quit or the cash in the wallet is 0 [Mark out of 5:5 ]
Comment:yes
I ask the user to enter any of the four bet types or quit [Mark out of 5:5 ].
Comment:yes
My program calls resolveBet for each bet type entered [Mark out of 5: 5].
Comment:yes
At the end of the game my program presents a summary message regarding winnings and losses [Mark out of 5: ]
Comment:

 Total Mark out of 100 (Add all the previous marks):
 */
import java.util.Scanner;


public class DiceGame {
	public static int wins;
	public static int losses;
	
	public static void main (String[]args) {
		Wallet wallet = new Wallet();
		double netWorth;
		boolean finished = false;
		String choice;
		Scanner input = new Scanner(System.in);
		System.out.print("Please input net worth (€)> ");
		if(input.hasNextDouble()) {
			netWorth = input.nextDouble();
			if(netWorth > 0) {
				wallet.put(netWorth);
				while(finished == false) {
					System.out.print("Please choose what type of bet you would like to make (triple, field, high, low, quit)> ");
					choice = input.next();
					if(choice.equalsIgnoreCase("triple") 
							|| choice.equalsIgnoreCase("field") 
							|| choice.equalsIgnoreCase("low")) {
						ResolveBet(choice, wallet);

					}
					else if(choice.equalsIgnoreCase("quit") || wallet.check() == 0) {
						System.out.print("You have either entered 'quit' or there is no money left in your wallet. Please come again.");
						finished = true;
					}
					else {
						System.out.print("Try again \n");
					}
				}
			}
			else {
				System.out.print("Please try again and input a valid amount");
			}
		}
		else {
			System.out.print("Please enter a provide valid input");
		}
		if(finished) {
			System.out.print("\nThank you for playing.\nTotal wins: " + wins + "\nTotal losses: " + losses);
		}
	}
	public static void ResolveBet(String choice, Wallet wallet) {
		boolean finished = false;
		System.out.print("You currently have " + wallet.check() + "€ in your wallet\n");
		System.out.print("Please input the amount you would like to bet (€)> \n");
		Scanner bettingInput = new Scanner(System.in);
		double bettingAmount = bettingInput.nextDouble();
		wins = 0;
		losses = 0;
		while(finished == false) {

			if(bettingAmount <= wallet.check()) {
				Dice dice1 = new Dice();
				Dice dice2 = new Dice();
				Dice dice3 = new Dice();
				int roll1 = dice1.roll();
				int roll2 = dice2.roll();
				int roll3 = dice3.roll();
				int total = roll1 + roll2 + roll3;
				if(choice.equalsIgnoreCase("triple")) {
					if(roll1 == roll2 && roll1 == roll2 && roll2 == roll3) {
						if(roll1 == 1 || roll1 == 6) {
							System.out.print("You lose.\n");
							wallet.get(bettingAmount);
							losses ++;
						}
						else {
							System.out.print("Ka-ching!!! You win. \n");
							wallet.put(bettingAmount * 30);
							wins++;
						}
					}
					else {
						System.out.print("You lose.\n");
						wallet.get(bettingAmount);
						losses++;
					}
				}
				else if(choice.equalsIgnoreCase("field")) {
					if(total > 12 || total < 8) {
						System.out.print("Ka-ching!!! You win. \n");
						wallet.put(bettingAmount);
						wins++;
					}
					else {
						System.out.print("You lose.\n");
						wallet.get(bettingAmount);
						losses++;
					}
				}
				else if(choice.equalsIgnoreCase("high")) {
					if(total > 10) {
						if(roll1 == roll2 && roll1 == roll3 && roll2 == roll3) {
							System.out.print("You lose.\n");
							wallet.get(bettingAmount);
							losses ++;
						}
						else {
							System.out.print("Ka-ching! You win!\n");
							wallet.put(bettingAmount);
							wins++;
						}
					}
				}
				else if(choice.equalsIgnoreCase("low")) {
					if(total < 11) {
						if(roll1 == roll2 && roll1 == roll3 && roll2 == roll3) {
							System.out.print("You lose.\n");
							wallet.get(bettingAmount);
							losses++;
						}
						else {
							System.out.print("Ka-ching! You win!\n");
							wallet.put(bettingAmount);
							wins++;
						}
					}
				}
				finished = true;
			}
			else {
				System.out.print("You do not have enough money in your wallet, please input a smaller amount next timel.\n");
				break;
			}
		}
	}
}

