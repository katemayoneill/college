//Seán
class Date implements Comparable<Date> {
  int day;
  int month;
  int year;
  int time;
  String dateString;
  boolean [] estimatedData;
  
  Date( Date date)
  {
    this.day = date.day;
    this.month = date.month;
    this.year = date.year;
    this.time = date.time;
    this.dateString = date.dateString;
    this.estimatedData = date.estimatedData;
  }
  Date(String date) {
    String[] currentString = date.trim().replaceAll(" +", " ").split(" ");
    estimatedData = new boolean[4];
    dateString = date;
    
    for (int i = 0; i <currentString.length; i++)
    {
      if (currentString[i].contains("?") ||currentString[i].contains("-"))
        estimatedData[i] = true;
    }
    
    //println(Arrays.toString(parameters), "|"+Arrays.toString(currentString));
    this.year = parseInt(currentString[0].replace("s","").replace("?",""));

    if (currentString.length == 1)
    {
      month = 0;
      return;
    }
    if (currentString[1] == null)
      month = 0;
    else
    {
      month = monthToInt(currentString[1].replace("?",""));
    }
    if (currentString.length == 2)
     {
       day = 0;
       return;
     }
    if (currentString[2] ==null)
      day = 0;
    else
    {
      this.day = parseInt(currentString[2].replace("?", ""));
    }
    if (currentString.length == 3)
     {
       time = 0;
       return;
     }
    if (currentString[3]==null)
      time = 0;
    else
    {
      time = parseInt(currentString[3].replace("?",""));
    } 
  }
  
  int monthToInt(String month)
  {
    switch(month) {
        case("Jan"):
        return 1;
        case("Feb"):
        return 2;
        case("Mar"):
        return 3;
        case("Apr"):
        return 4;
        case("May"):
        return 5;
        case("Jun"):
        return 6;
        case("Jul"):
        return 7;
        case("Aug"):
        return 8;
        case("Sep"):
        return 9;
        case("Oct"):
        return 10;
        case("Nov"):
        return 11;
        case("Dec"):
        return 12;
        default:
        return 0;
      }
  }
  public int compareTo(Date anotherDate) // peter, added comparisons
  {
    if (year > anotherDate.year)
      return 1;
    else if (year < anotherDate.year)
      return -1;
    else if (month > anotherDate.month)
      return 1;
    else if (month < anotherDate.month)
      return -1;
    else if (day > anotherDate.day)
      return 1;
    else if (day < anotherDate.day)
      return -1;
    else if (time > anotherDate.time)
      return 1;
    else if (time < anotherDate.time)
      return -1;
    else
      return 0;
  }
  
  boolean isGreaterThan(Date anotherDate)
  {
    return compareTo(anotherDate) > 0;
  }
  boolean isLessThan(Date anotherDate)
  {
    return compareTo(anotherDate) < 0;
  }
  boolean isEqualTo(Date anotherDate)
  {
    return compareTo(anotherDate) == 0;
  }
  boolean isGreaterThanOrEqual(Date anotherDate)
  {
    return isGreaterThan(anotherDate) || isEqualTo(anotherDate);
  }
  boolean isLessThanOrEqual(Date anotherDate)
  {
    return isLessThan(anotherDate) || isEqualTo(anotherDate);
  }

  String toString()
  {
    return dateString;
  }
}
