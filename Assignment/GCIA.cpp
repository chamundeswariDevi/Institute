using namespace System;
ref class Employee {
    private:
			int eno;
        	String^ enmae;
        	double balance;
        
    public:
	    Account(int en,String^ ename,double b){
            eno = a;
            ename = n;
            balance = b;
        }

        property int EmployeeNo{
            int get()
            {
                return eno;
            }
        }
        property String^ Ename
        {
            String^ get()
            {
                return ename;
            }
            void set(String^ t)
            {
                ename = n;
            }
        }
        property double Balance
        {
            double get()
            {
                return balance;
            }
        }

        
int main(){		
		Employee^ e=gcnew Employee(101,"OS",40000);
		a->Deposit(45000);
}
