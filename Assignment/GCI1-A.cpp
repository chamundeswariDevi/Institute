using System;
using System.Collections.Generic;

class employeee : IComparable
{
    public int empno;
    public string empname;
    public string job;
    public int salary;
    public int deptno;

    public employeee(int no,string Name, string j,int sal ,int dno)
    {
        empno = no;
        empname = Name;
        job = j;
        salary = sal;
        deptno = dno;
    }
    public int CompareTo(object obj)
    {
        return -(salary - ((employeee)obj).salary);
    }
}

class emp
{
    static void Main(string[] args)
    {
        List<employeee> emp = new List<employeee>();
        
       emp.Add(new employeee(3434,"mahesh" ,"test en",25000,10));
        emp.Add(new employeee(4545, "naresh", "programer", 70000, 20));
        emp.Add(new employeee(4523, "rajesh", "manager", 50000, 10));
        emp.Sort();

        foreach (int employeee e in emp)
        {
            string a = e.empno.ToString();
            string b=e.empname;
            string ca = e.job;
            string d = e.salary.ToString();
            string e = e.deptno.ToString();

            Console.WriteLine("{0}",a +"\t"+ b +"\t"+ ca + "\t" + d + "\t" + e);
        }
    }
}


