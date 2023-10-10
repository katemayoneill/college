Wizard Currency AssignmentWizard Currency Assignment
Write a program (and call the class WizardCurrency and the file  WizardCurrency.java) to allow user to repeatedly
1. Convert Wizarding Currency To GBP
2. Convert Knuts To Wizarding Currency and GBP
3. Convert GBP to Wizarding Currency
4. Quit
As part of your program you must write and make use of the following functions:
public static int convertGBPToKnuts( int pounds, int pence ) which takes the number of British pounds and pence and converts this to Knuts.
public static String convertKnutsToWizardingCurrency( int totalKnuts ) which takes the total number of Knuts and returns a String specifying the amount in Wizarding currency e.g. "HP<Galleons>:<Sickles>:<Knuts>" such as HP12:5:18
public static String convertGBPToWizardingCurrency( int pounds, int pence ) which takes the total number of British pounds and pence and returns a String specifying the amount in Wizarding currency e.g. "HP<Galleons>:<Sickles>:<Knuts>" such as HP12:5:18
public static int convertWizardingCurrencyToKnuts( int numGalleons, int numSickles, int numKnuts ) which takes a wizarding currency amount in Galleons, Sickles and Knuts and returns the amount in Knuts only (e.g. 1 Galleon, 1 Sickles and 5 Knuts is 527 Knuts).
public static int convertWizardingCurrencyToPence( int numGalleons, int numSickles, int numKnuts ) which takes a wizarding currency amount in Galleons, Sickles and Knuts and returns the amount in British pence only (e.g. 1 Galleon, 11 Sickles and 0 Knuts is GBP4.99).
public static double getNumberFromUser( String prompt, String errorMessage, Scanner input, boolean integerRequired ) which obtains a double (if integerRequired is false) or integer (if integerRequired is true) from the user via the input Scanner.  It outputs the passed prompt first, tries to get the number from the Scanner and returns the number.  If the input is not in the correct form the passed errorMessage is output and the system tries to get the number again.
Notes:
1 Galleon = 17 Sickles = 493 Knuts
Based on price on the back of the original UK Harry Potter, £4.99 = 1 Galleon + 11 Sickles
GBP stands for British Pounds which is often indicated by the £ sign.  A single British pounds if equal to 100 pence,
We are representing Wizarding currency as follows: HP12:5:18 is 12 Galleons, 5 Sickles and 18 Knuts
IT IS STRONGLY RECOMMENDED THAT you intially create dummy versions of all the required functions (returning constant values) and then develop one routine at a time, using the WebCat evaluation to give you some confidence that you have solved the problem correctly.  Get all the other functions finished before you start working on main().
Sample expected input/output (user input shown in green)
1. Convert Wizarding Currency To GBP
2. Convert Knuts To Wizarding Currency and GBP
3. Convert GBP to Wizarding Currency
4. Quit
Select function> 1
Enter the number of Galleons > no
Error: The number of Galleons should be an integer (e.g. 3)
Enter the number of Galleons > 1
Enter the number of Sickles > adsa
Error: The number of Sickles should be an integer (e.g. 5)
Enter the number of Sickles > 16
Enter the number of Knuts > eds
Error: The number of Knuts should be an integer (e.g. 12)
Enter the number of Knuts > 28
In British Pounds HP1:16:28 is GBP6.05

1. Convert Wizarding Currency To GBP
2. Convert Knuts To Wizarding Currency and GBP
3. Convert GBP to Wizarding Currency
4. Quit
Select function> 2
Enter the number of Knuts > rubbish
Error: The number of Knuts should be an integer (e.g. 56)
Enter the number of Knuts > 1000
1000 knuts is HP2:0:14 is equal to GBP6.15

1. Convert Wizarding Currency To GBP
2. Convert Knuts To Wizarding Currency and GBP
3. Convert GBP to Wizarding Currency
4. Quit
Select function> 3
Enter the number of British pounds and pence (e.g. 1.24) > 1.24
In wizarding currency GBP1.24 is HP0:6:28

1. Convert Wizarding Currency To GBP
2. Convert Knuts To Wizarding Currency and GBP
3. Convert GBP to Wizarding Currency
4. Quit
Select function> 3
Enter the number of British pounds and pence (e.g. 1.24) > adfa
Error: Invalid number of British pounds and pence
Enter the number of British pounds and pence (e.g. 1.24) > 1.24
In wizarding currency GBP1.24 is HP0:6:28

1. Convert Wizarding Currency To GBP
2. Convert Knuts To Wizarding Currency and GBP
3. Convert GBP to Wizarding Currency
4. Quit
Select function> 5
Error: Invalid selection.

1. Convert Wizarding Currency To GBP
2. Convert Knuts To Wizarding Currency and GBP
3. Convert GBP to Wizarding Currency
4. Quit
Select function> 4

Submission
This assignment (your WizardCurrency.java file) must be submitted via Web-CAT (at https://webcat.scss.tcd.ie/cs2012/) by Sunday November 28th at 23:55.  The Web-CAT system will automatically evaluate whether you solved the problem correctly using a number of test cases and will also evaluate whether you used the correct prompts and correct output format.  100% of the marks for this assignment will be awarded automatically based on this Web-CAT evaluation (which will evaluate the overall program AND the individual functions).  You may submit to (and have your code evaluated by) the Web-CAT system as often as you like before the deadline.
