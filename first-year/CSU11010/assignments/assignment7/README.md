Stopping Distance Assignment (with functions)

Write a program (and call the class StoppingDistance3, and the file StoppingDistance3.java) to compute how long it would take in metres to stop a vehicle based on
1. the speed that it is travelling at (in kilometres per hour),
2. the age of the driver,
3. whether the road is wet or dry or icy.
   
Notes:

You must write and use all of the following functions:
 public static double computeCoefficientOfFriction(boolean roadIsIcy, boolean roadIsWet)
 public static double computeBrakingDistance(double vehicleSpeed, boolean roadIsIcy, boolean roadIsWet)
 public static double computeReactionDistance(double vehicleSpeed, int age)
 public static int computeStoppingDistance(double vehicleSpeed, int age, boolean roadIsIcy, boolean roadIsWet)
 
Assume that the reaction time of the driver (in seconds) is 1.0 seconds + |age-24|*0.05 .
The braking distance is the square of the speed of the vehicle (in kilometres per hour) divided by 250 times the coefficient of friction.
You may assume that the vehicle is travelling on a tarmac road and that the coefficient of friction for a tarmac road is 0.8 if the road is dry, 0.4 if the road is wet and 0.1 if the road is icy.
The stopping distance is to be computed as the sum of the reaction distance (which is the speed in metres per second times the reaction time in seconds) and the braking distance.
You must use exactly the same formatting (language, spacing, etc.) as shown in the expected input/output is shown below.
You must handle invalid input as shown in the last sample run below.

IT IS STRONGLY RECOMMENDED THAT you intially create dummy versions of all the required functions (returning constant values) and then develop one routine at a time, using the WebCat evaluation to give you some confidence that you have solved the problem correctly.  Get all the other functions finished before you start working on main().
Sample expected input/output (4 separate runs, user input in green:)
Enter vehicle speed in km/hr> 50.2
Enter age in years> 30
Is the road wet (Yes/No)? Yes
Is the road icy (Yes/No)? yes
As the road is icy and wet, the coefficient of friction is 0.1
At a speed of 50.2km/hr, a driver who is 30 years old, the reaction distance is 18m, the braking distance is 101m, and so the stopping distance is 119m
 
Enter vehicle speed in km/hr> 35.7
Enter age in years> 19
Is the road wet (Yes/No)? Yes
Is the road icy (Yes/No)? no
As the road is wet, the coefficient of friction is 0.4
At a speed of 35.7km/hr, a driver who is 19 years old, the reaction distance is 12m, the braking distance is 13m, and so the stopping distance is 25m
 
Enter vehicle speed in km/hr> 45.7
Enter age in years> 60
Is the road wet (Yes/No)? no
Is the road icy (Yes/No)? no
As the road is dry, the coefficient of friction is 0.8
At a speed of 45.7km/hr, a driver who is 60 years old, the reaction distance is 36m, the braking distance is 10m, and so the stopping distance is 46m
 
Enter vehicle speed in km/hr> no
Error: Enter a positive number for the speed of the vehicle.
Enter vehicle speed in km/hr> not again
Error: Enter a positive number for the speed of the vehicle.
Enter vehicle speed in km/hr> 60.2
Enter age in years> nine
Error: Enter a positive whole number for the age of the driver.
Enter age in years> ten
Error: Enter a positive whole number for the age of the driver.
Enter age in years> 69
Is the road wet (Yes/No)? why do you want to know
Error: You must enter either Yes or No.
Is the road wet (Yes/No)? I don't want to say
Error: You must enter either Yes or No.
Is the road wet (Yes/No)? no
Is the road icy (Yes/No)? not now
Error: You must enter either Yes or No.
Is the road icy (Yes/No)? yes
As the road is icy and dry, the coefficient of friction is 0.1
At a speed of 60.2km/hr, a driver who is 69 years old, the reaction distance is 54m, the braking distance is 145m, and so the stopping distance is 199m

 
Submission

This assignment (your StoppingDistance3.java file) must be submitted via Web-CAT (at https://webcat.scss.tcd.ie/cs2012/) by Sunday November 21st at 23:55.  The Web-CAT system will automatically evaluate whether you solved the problem correctly using a number of test cases and will also evaluate whether you used the correct prompts and correct output format.  80% of the marks for this assignment will be awarded automatically based on this Web-CAT evaluation (which will evaluate the overall program AND the individual functions).  You may submit to (and have your code evaluated by) the Web-CAT system as often as you like before the deadline.
Before you submit though you need to self-assess whether you addressed the requirements to make your code easy to understand.  Copy the multi line comment below and put it at the top of your program.  Put in a mark and a comment for each criterion (even if you have given yourself full marks, otherwise marks will be deducted per criterion that is missing this information).  This self-assessment will be used when the demonstrator marks the understandability of your code (counting in this case for 20% of the marks).

/*  SELF ASSESSMENT of whether my code is easy to understand.
   1. Did I use easy-to-understand meaningful and properly formatted variable names and constants?
       Mark out of 5:   
       Comment: 
    2. Did I indent the code appropriately?
       Mark out of 5:   
       Comment: 
   3. Did I make use of the functions appropriately within main and the other functions?
       Mark out of 5:   
       Comment: 
   4. Have I avoided inappropriate duplication of code?
       Mark out of 5:   
       Comment: 
     Total Mark out of  20 (Add all the previous marks):  
*/

