using namespace System;
ref class Account {
    private:
			int ano;
        	String^ title;
        	double balance;
        
    public:
	    Account(int a,String^ t,double b){
            ano = a;
            title = t;
            balance = b;
        }

        property int AccountNo{
            int get()
            {
                return ano;
            }
        }
        property String^ Title
        {
            String^ get()
            {
                return title;
            }
            void set(String^ t)
            {
                title = t;
            }
        }
        property double Balance
        {
            double get()
            {
                return balance;
            }
        }

        void Deposit(double amt)
        {
            this->balance += amt;
            Console::WriteLine("Balance is : {0}", this->balance);
        }

        void Withdraw(double amt)
        {
            this->balance -= amt;
            Console::WriteLine("Balance is : {0}", this->balance);
        }
};

ref class Trasaction
{
private:
    int accno;
    string^ trDate;
    string^ trType;
    double amount;
public:
   Transaction(int ac, String^ td, string^ tt,double a) {
        accno = ac;
        trDate = td;
        trType = tt;
        amount = a;
        property int TransactionNo {
            int get()
            {
                return accno;
            }
        }
        property String^ Transdate
        {
            String^ get()
            {
                return trDate;
            }
            void set(String^ td)
            {
                trDate = td;
            }
        }
        property String^ Transtype
        {
            String^ get()
            {
                return trtype;
            }
            void set(String^ td)
            {
                trType = tt;
            }
        }

        property double Amount
        {
            double get()
            {
                return amount;
            }
        }
    }

};

int main(){		
		
        List<Accoun>^ la = gcnew List<Account>(101, "OS", 40000);
		a->Deposit(45000);
        List<Trasaction>^ ta = gcnew List<Trasaction>(1, "12-2-2022", "W", 400);;
        a->W(400);
}
