using System;
namespace Practice{
  public class Account{
        private int ano;
        private string title;
        private double balance;

        public Account(){
            ano = 101;
            title = "NKXGEN";
            balance = 50000;
        }

        public Account(int a,string t,double b){
            ano = a;
            title = t;
            balance = b;
        }

        public int AccountNo{
            get
            {
                return ano;
            }
            set
            {
                ano = value;
            }
        }
        public string Title{
            get
            {
                return title;
            }
            set
            {
                title = value;
            }
        }
        public double Balance
        {
            get
            {
                return balance;
            }
            set
            {
                balance = value;
            }
        }
        public Transaction(){
           accno = 101;
            trDate = "NKXGEN";
            trType = "w";
            amount =4000;
        }

        public Account(int a,string t,,string tt,double b){
            accno = a;
            trDate = t;
            trType = tt;
            amount =b;
        }

        public int AccountNo{
            get
            {
                return accno;
            }
            set
            {
                accno = value;
            }
        }
        public string TrDate{
            get
            {
                return trDate;
            }
            set
            {
                trDate = value;
            }
        }
        public string TrType{
            get
            {
                return trtype;
            }
            set
            {
                trDate = value;
            }
        }

        public double Amount
        {
            get
            {
                return amount;
            }
            set
            {
                amount = value;
            }
        }

        public void Deposit(double amt)
        {
            this.balance += amt;
            Console.WriteLine("Balance is : {0}", balance);
        }

        public void Withdraw(double amt)
        {
            this.balance -= amt;
            Console.WriteLine("Balance is : {0}", balance);
        }


        List<Account> la=gcnew List<Accounts>(101,"NEXGEN",50000);
        la->deposit();
        List<Transaction> la1=gcnew List<Transaction>(101,"NEXGEN","W",50000);
        la1->Withdraw();

  }
}
