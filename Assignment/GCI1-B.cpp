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
        List<employeee> eml = new List<employeee>();
        
       emp.Add(new employeee(3434,"mahesh" ,"test en",25000,10));
        emp.Add(new employeee(4545, "naresh", "programer", 70000, 20));
        emp.Add(new employeee(4523, "rajesh", "manager", 50000, 10));
        emp.Sort();

        foreach ( employeee e in emp)
        {
            string a = c.empno.ToString();
            string b=c.empname;
            string ca = c.job;
            string d = c.salary.ToString();
            string e = c.deptno.ToString();

            Console.WriteLine("{0}",a +"\t"+ b +"\t"+ ca + "\t" + d + "\t" + e);
        }
    }
}


