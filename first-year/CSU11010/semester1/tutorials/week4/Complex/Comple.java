public class Complex
{
    private double x;
    private double y;

    Complex()
    {
        x = 0;
	y = 0;
    }

    Complex(double realPart, double imaginaryPart)
    {
	x = realPart;
	y = imaginaryPart;
    }

    public static Complex add(Complex a, Complex b)
    {
	return new Complex(a.x+b.x, a.y+b.y);
    }

    public static Complex multiply(Complex a, Complex b)
    {
        return new Complex((a.x*b.x - a.y*b.y), (a.x*b.y + a.y*b.x));
    }
 
    public static Complex divide(Complex a, Complex b)
    {
	return new Complex(((a.x*b.x + a.y*b.y)/(Math.pow(b.x, 2) + Math.pow(b.y, 2))),
		(((a.y*b.x) - (a.x*b.y))/(Math.pow(b.x, 2) + Math.pow(b.y, 2))));
    }

    public String toString()
    {
	return "{" + x + "," + y + "}";
    }
}