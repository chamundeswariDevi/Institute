using System;
using System.Collections.Generic;
class Employee{
		public static void Main(string[] args){
            empid id;
            empname name;
            empp position;
            empsal salary;
            empnum n;

            public void Employee(id i,name n,position p,salary s,n num)
            {
                empid = i;
                empname =n;
                empp = p;
                empsal = s;
                empnum = num;
                List<Employee> emp=new List<Employee>();
			    Employee emp1,emp2,emp3;
			    emp1=new Employee(334,"mahesh","testengineer",25000,10);
			    emp2=new Employee(4545,"naresh","programmer",70000,20);
			    emp3=new Employee(4523,"rajesh","manager",50000,10);

			    emp.Add(emp1);
			    emp.Add(emp2);
			    emp.Add(emp3);

			//iterating
			foreach(Employee e in emp){
				Console.WriteLine(e);
			}
            }
			
			
		}
}