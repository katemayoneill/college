class BankCustomer
{
    private int accountNumber;
    private String customerName;
    private String customerAddress;
    private int customerDateOfBirth;

    public int getAccountNumber()
    {
	return accountNumber;
    }

    public void setAccountNumber(int accNumber)
    {
	accountNumber = accNumber;
    }

    public String getCustomerName()
    {
	return customerName;
    }

    public void setCustomerName(String name)
    {
	customerName = name;
    }

    public String getCustomerAddress()
    {
	return customerAddress;
    }

    public void setCustomerAddress(String address)
    {
	customerAddress = address;
    }

    public int getCustomerDateOfBirth()
    {
	return customerDateOfBirth;
    }

    public void setCustomerDateOfBirth(int dob)
    {
	customerDateOfBirth = dob;
    }

    public static String findCustomer(BankCustomer[] array, int accNumber)
    {
	int i = 0;
	boolean found = false;
	while(!found)
        {
	    if(array[i].accountNumber == accNumber)
		found = true;
	    else
		i++;
	}
	return array[i].customerName;
    }

    public static String findCustomer(BankCustomer[] array, int dob, String addr)
    {
	int i = 0;
	boolean found = false;
	while(!found)
        {
	    if(array[i].customerDateOfBirth == dob && array[i].customerAddress == addr)
		found = true;
	    else
	        i++;
	}
	return array[i].customerName;
    }

    public static void main(String[] args)
    {
	String cus;
	BankCustomer[] bankCustomers = new BankCustomer[10];

	for(int i=0; i<bankCustomers.length; i++)
	    bankCustomers[i] = new BankCustomer();

	bankCustomers[0].setAccountNumber(12345);
	bankCustomers[0].setCustomerName("Joe Rooney");
	bankCustomers[0].setCustomerAddress("Apt 2, Trinity College");
	bankCustomers[0].setCustomerDateOfBirth(210598);

	bankCustomers[1].setAccountNumber(56789);
	bankCustomers[1].setCustomerName("Jane McDonald");
	bankCustomers[1].setCustomerAddress("Apt 34, Temple Bar, Dublin 2");
	bankCustomers[1].setCustomerDateOfBirth(210598);

        cus = findCustomer(bankCustomers, 12345);
	System.out.printf("%n%s%n", cus);

	cus = findCustomer(bankCustomers, 210598, "Apt 34, Temple Bar, Dublin 2");
	System.out.printf("%n%s%n", cus);
    }
}
