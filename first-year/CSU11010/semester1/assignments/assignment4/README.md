Firsts and Passes Assignment

Write a program in Java (and call it FirstsAndPasses) which takes in the number of students in a class and then executes a for loop taking in the percentage obtained by each student in an exam.  The program should do something reasonable if a negative number of students (or 0 students) is entered as the class size. Once all percentages are entered the program should report the number of firsts (those whose rounded marks was 70% or greater) and also the percentage of students who passed i.e. those whose rounded mark was 40% or greater).  If any percentages entered are invalid the user should be told and the value requested again.

Sample expected input/output (3 separate runs, user input in green):
Enter the number of students in the class> 3
Enter the percentage obtained by student 1> 68.1
Enter the percentage obtained by student 2> 75.3
Enter the percentage obtained by student 3> -12
Invalid percentage.  Please enter the mark again for this student.
Enter the percentage obtained by student 3> -23
Invalid percentage.  Please enter the mark again for this student.
Enter the percentage obtained by student 3> 30
In this class of 3 students, 1 got a first class honour and 66.7% passed the class
 
Enter the number of students in the class> -2
Error:  The number of students must be greater than 0
 
Enter the number of students in the class> 2
Enter the percentage obtained by student 1> 100
Enter the percentage obtained by student 2> 99.2
In this class of 2 students, 2 got a first class honour and 100.0% passed the class

Submission

This assignment must be submitted via Web-CAT (at https://webcat.scss.tcd.ie/cs2012/) by Sunday October 31st at 23:55.  The Web-CAT system will automatically evaluate whether you solved the problem correctly using a number of test cases and will also evaluate whether you used the correct prompts and correct output format.  65% of the marks for this assignment will be awarded automatically based on this Web-CAT evaluation.  You may submit to (and have your code evaluated by) the Web-CAT system as often as you like before the deadline.
Before you submit though you need to self-assess whether you addressed the requirements to make your code easy to understand.  Copy the multi line comment below and put it at the top of your program.  Put in a mark and a comment for each criterion (even if you have given yourself full marks, otherwise marks will be deducted per criterion that is missing this information).  This self-assessment will be used when the demonstrator marks the understandability of your code (counting in this case for 35% of the marks).

/*  SELF ASSESSMENT of whether my code is easy to understand.
   1. Did I use easy-to-understand meaningful variable and constant names?
       Mark out of 10:   
       Comment: 
   2. Did I format the variable and constant names properly (in lowerCamelCase and UPPERCASE)?
       Mark out of 5:   
       Comment: 
   3. Did I indent the code appropriately?
       Mark out of 10:   
       Comment: 
   4. Did I implement a for loop to read the input as required?
       Mark out of 10:   
       Comment: 
      Total Mark out of  35 (Add all the previous marks):  
*/
