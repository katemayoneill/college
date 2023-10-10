Advanced Stopping Distance AssignmentAdvanced Stopping Distance Assignment

Write a program in Java (and call it StoppingDistance2) to compute how long it would take in metres to stop a vehicle based on
1. the speed that it is travelling at (in kilometres per hour),
2. the age of the driver,
3. whether the road is wet or dry.

Notes:

Assume that the reaction time of the driver (in seconds) is 2.0 seconds if the driver is less than 50 years old, is 2.5 seconds if the driver is between 50 and 59 years old, and is 3.0 seconds if the driver is 60 or older.
The braking distance is the square of the speed of the vehicle (in kilometres per hour) divided by 250 times the coefficient of friction.
You may assume that the vehicle is travelling on a tarmac road and that the coefficient of friction for a tarmac road is 0.8 if the road is dry and 0.4 if the road is wet.
The stopping distance is to be computed as the sum of the reaction distance (which is the speed in metres per second times the reaction time in seconds) and the braking distance.
You must use exactly the same formatting (language, spacing, etc.) as shown in the expected input/output is shown below.
Sample expected input/output (3 separate runs, user input in green:)
Enter vehicle speed in km/hr> 50.0
Enter age in years> 37
Is the road wet (Yes/No)? Yes
As the road is wet, the coefficient of friction is 0.4
As the driver is 37 years old, his/her reaction time is 2.0s
At a speed of 50.0km/hr, the reaction distance is 28m, the braking distance is 25m, and so the stopping distance is 53m

Enter vehicle speed in km/hr> 50.0
Enter age in years> 37
Is the road wet (Yes/No)? No
As the road is dry, the coefficient of friction is 0.8
As the driver is 37 years old, his/her reaction time is 2.0s
At a speed of 50.0km/hr, the reaction distance is 28m, the braking distance is 13m, and so the stopping distance is 40m

Enter vehicle speed in km/hr> 40.0
Enter age in years> 65
Is the road wet (Yes/No)? Yes
As the road is wet, the coefficient of friction is 0.4
As the driver is 65 years old, his/her reaction time is 3.0s
At a speed of 40.0km/hr, the reaction distance is 33m, the braking distance is 16m, and so the stopping distance is 49m

 
Submission

This assignment must be submitted via Web-CAT (at https://webcat.scss.tcd.ie/cs2012/) by Sunday October 24th at 23:55.  The Web-CAT system will automatically evaluate whether you solved the problem correctly using a number of test cases and will also evaluate whether you used the correct prompts and correct output format.  70% of the marks for this assignment will be awarded automatically based on this Web-CAT evaluation.  You may submit to (and have your code evaluated by) the Web-CAT system as often as you like before the deadline.
Before you submit though you need to self-assess whether you addressed the requirements to make your code easy to understand.  Copy the multi line comment below and put it at the top of your program.  Put in a mark and a comment for each criterion (even if you have given yourself full marks, otherwise marks will be deducted per criterion that is missing this information).  This self-assessment will be used when the demonstrator marks the understandability of your code (counting in this case for 30% of the marks).

/*  SELF ASSESSMENT of whether my code is easy to understand.
   1. Did I use easy-to-understand meaningful variable and constant names?
       Mark out of 15:   
       Comment: 
   2. Did I format the variable and constant names properly?
       Mark out of 5:   
       Comment: 
   3. Did I indent the code appropriately?
       Mark out of 10:   
       Comment: 
      Total Mark out of  30 (Add all the previous marks):  
*/
