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

    public static void main(String[] args)
    {
        /* Create an array that can hold reference to 10
           BankCustomer objects. Does not create the objects */
	BankCustomer[] bankCustomers = new BankCustomer[10];
	
	// Instantiate the objects
	for(int i=0; i<bankCustomers.length; i++)
	    bankCustomers[i] = new BankCustomer();

	bankCustomers[0].setAccountNumber(12345);

	System.out.println("Customer Account Number is " + bankCustomers[0].getAccountNumber());
    }
}