using System;
using System.Collections.Generic;

namespace DIC
{
    public class Dict
    {
        static void Main()
        {
                   
            List<Subject> sss1 = new List<Subject>();
            sss.Add(new Subject(1, "english", 23, 82));
            sss.Add(new Subject(2, "social", 34, 54));
            
            List<Subject> ss2 = new List<Subject>();
           sss2.Add(new Subject(3, "maths", 54, 67));
            ss2.Add(new Subject(4, "science", 66, 44));

                      
            List<Subject> ss3= new List<Subject>();
            ss3.Add(new Subject(1, "english", 66, 99));
            ss3.Add(new Subject(2, "ns", 55, 77));
            
            List<Subject> ss4 = new List<Subject>();
            ss4.Add(new Subject(3, "ps", 66,88));
            ss4.Add(new Subject(4, "hs", 33, 77));

            
            Dictionary<string,List<Subject>> sm = new Dictionary<string,List<Subject>>();
            sm.Add("sem1", stud1sem1subjects);
            sm.Add("sem2", stud1sem2subjects);
            
            Dictionary<string, List<Subject>> sm2 = new Dictionary<string, List<Subject>>();
            sm2.Add("sem1", stud2sem1subjects);
            sm2.Add("sem2", stud2sem2subjects);

           
            Dictionary<int, Dictionary<string, List<Subject>>> students = new Dictionary<int, Dictionary<string, List<Subject>>>();
            students.Add(123, sm1);
            students.Add(125, sm2);

            
            foreach(KeyValuePair<int, Dictionary<string, List<Subject>>> student in students)
            {
                Console.WriteLine("Roll No: {student.Key}");
                foreach(var kvp in student.Value)
                {
                    Console.WriteLine(kvp.Key);
                    foreach(var subject in kvp.Value)
                    {
                        Console.WriteLine(subject);
                        Console.WriteLine();
                    }
                    Console.WriteLine();
                }
                Console.WriteLine();
            }
        }
    }
}
