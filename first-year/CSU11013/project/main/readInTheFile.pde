// Peter
import java.io.FileInputStream;
import java.io.*;

public ArrayList <String []>  getFile(String fileName, int numColumns)
{
  ArrayList < String []> data = new ArrayList< String []>();
  try (BufferedReader fin = createReader(fileName))
  {
    int charAscii = 0;
    boolean lastWasNewLine = false;
    String currentString = "";
    String [] currentLine = new String[numColumns];
    int currentColIndex = 0;
    while ((charAscii = fin.read())!=-1)
    {
      switch (charAscii)
      {
      case '\t':   // tab
        lastWasNewLine = false;
        switch (currentString)
        {
        case " ":
        case "-":
          currentString = null;
        }
        currentLine[currentColIndex] = currentString;
        currentColIndex ++;
        currentString = "";
        break;
      case '\r':   // new line 
            case '\n':    // line feed
        if (!lastWasNewLine)
        {
          currentLine[currentColIndex] = currentString;
          currentColIndex = 0;
          currentString = "";
          data.add(currentLine);
          currentLine = new String[numColumns];
          lastWasNewLine = true;
        }
        break;
      default:
        lastWasNewLine = false;
        currentString = currentString + (char)charAscii;
      }
    }
    return data;
  }
  catch(Exception e)
  {
    System.err.println(e);
    throw new RuntimeException(e);
  }
}


// no longer peter
