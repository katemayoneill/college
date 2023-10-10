public class BankCustomer
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
	BankCustomer cust1 = new BankCustomer();

	cust1.setAccountNumber(12345);
	cust1.setCustomerName("John Smith");
	cust1.setCustomerAddress("Beverly Hills");
	cust1.setCustomerDateOfBirth(290271);
    }
}