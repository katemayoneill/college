Marks Remapper Assignment

Write a program (and call the class MarksRemapper, and the file MarksRemapper.java) which takes any number of percentages from the user on a single line, and changes remaps these percentages so that the average is 60.0% and the standard deviation is 20.0%.    Note that if any marks go below 0.0 or above 100.0 they should be set to 0.0 or 100.0 respectively (although this will change the average and standard deviation somewhat).  Output should be as shown in the examples.
As part of your program you must write and make use of the following functions:
public static double determineAverage( double[] arrayOfNumbers )  This routine should determine the average of all the numbers in the passed array (or 0.0 if the array is empty).
public static double determineStandardDeviation( double[] arrayOfNumbers, double average )  This routine should determine the standard deviation of all the numbers in the passed array (or 0.0 if the array is empty), given the passed value for the average.
public static boolean modifyAllMarks( double[] arrayOfMarks, double desiredAverage, double desiredStandardDeviation )  This routine should remap the marks in the passed array so that the average and standard deviation of the values become the passed average and standard deviation.  The routine should return whether or not this was possible.  Note that where the array has a range of values the new marks should be computed using the following formula:
NewMark = DesiredAverage + (OldMark - OldAverage)*DesiredStandardDeviation/OldStandardDeviation

Note:  It is STRONGLY RECOMMENDED that you intially create dummy versions of all the required functions (returning constant values) and then develop one routine at a time, using the WebCat evaluation to give you some confidence that you have solved the problem correctly.  Get all the other functions finished before you start working on main().

Sample expected input/output (4 sample runs, user input in green)

Enter all percentages (separated by spaces): 15 40 23.4 100.0 29.5
The original average was 41.6 and the standard deviation was 30.3
15.0->42.5, 40.0->59.0, 23.4->48.0, 100.0->98.5, 29.5->52.0
The new average is 60.0 and the new standard deviation is 20.0

Enter all percentages (separated by spaces): 40 60 60 62 80 40 40 100 60 61
The original average was 60.3 and the standard deviation was 17.9
40.0->37.3, 60.0->59.7, 60.0->59.7, 62.0->61.9, 80.0->82.0, 40.0->37.3, 40.0->37.3, 100.0->100.0, 60.0->59.7, 61.0->60.8
The new average is 59.6 and the new standard deviation is 19.1

Enter all percentages (separated by spaces): 1
The original average was 1.0 and the standard deviation was 0.0
1.0->60.0
The new average is 60.0 and the new standard deviation is 0.0
Enter all percentages (separated by spaces): 1 test 2
 Error: test is not a valid number.
The original average was 1.5 and the standard deviation was 0.5
1.0->40.0, 2.0->80.0
The new average is 60.0 and the new standard deviation is 20.0
 
Submission
This assignment (your MarksRemapper.java file) must be submitted via Web-CAT (at https://webcat.scss.tcd.ie/cs2012/) by Sunday December 5th at 23:55.  The Web-CAT system will automatically evaluate whether you solved the problem correctly using a number of test cases and will also evaluate whether you used the correct prompts and correct output format.  100% of the marks for this assignment will be awarded automatically based on this Web-CAT evaluation (which will evaluate the overall program AND the individual functions).  You may submit to (and have your code evaluated by) the Web-CAT system as often as you like before the deadline.
