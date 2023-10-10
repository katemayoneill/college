import java.util.HashMap; //peter

class DataPoint implements Comparable<DataPoint>
{
  HashMap<String, String> dataHashMap =  new HashMap<String,String>();
  String label;
  HashSet inactiveFilters;
  String currentSortedByField;
  DataPoint(String [] args, String[] cols)
  {
    for (int i = 0; i<args.length ; i++)
    {
      if (colTypes.get(cols[i]).equals("boolean"))
      {
        if (args[i]==null)
          args[i] = "Inactive";
        else
          args[i] = "Active";
      }
      else if (args[i] == null)
        args[i] = "null";
      dataHashMap.put(cols[i],args[i]);
    }
    label = autoNewLine(dataHashMap.toString(),90);
    inactiveFilters = new HashSet();
  }
  
  String get(String keyCol)
  {
    return dataHashMap.get(keyCol);
  }
  
  String toString()
  {
    return dataHashMap.toString();
  }
  public int compareTo(DataPoint anotherDataPoint) // peter, added comparisons
  {
    switch (colTypes.get(currentSortedByField))
    {
      case "String":
      case "Boolean":
        return get(currentSortedByField).compareTo(anotherDataPoint.get(currentSortedByField));
     case "int":
     case "float":
       double A;
       double B;
       try
       {
         A = Double.parseDouble(get(currentSortedByField));
         B = Double.parseDouble(anotherDataPoint.get(currentSortedByField));
         return (A > B)? 1 : ((A<B)? -1 : 0);
       }
       catch (NumberFormatException e)
       {
         if (!isNumeric(get(currentSortedByField)))
         {
           if (get(currentSortedByField).trim().equalsIgnoreCase("inf"))
             A = Integer.MAX_VALUE;
           else
             A = Integer.MIN_VALUE;
         }
         else
         {
           A = Double.parseDouble(get(currentSortedByField));
         }
         if (!isNumeric(anotherDataPoint.get(currentSortedByField)))
         {
           if (anotherDataPoint.get(currentSortedByField).trim().equalsIgnoreCase("inf"))
             B = Integer.MAX_VALUE;
           else
             B = Integer.MIN_VALUE;
         }
         else
         {
           B =  Double.parseDouble(anotherDataPoint.get(currentSortedByField));
         }
         
         return (A > B)? 1 : ((A<B)? -1 : 0);
       }
    case "Date":
      return new Date(get(currentSortedByField)).compareTo(new Date(anotherDataPoint.get(currentSortedByField)));
    default:
      return 0;
  }
  }
}
