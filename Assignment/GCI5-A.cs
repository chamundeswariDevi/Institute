using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Npgsql;

namespace ConsoleApp1
{
    internal class TestDataSets1
    {
        public void Test()
        {
            NpgsqlConnection conn;
            string cs;
            cs = "host=localhost:5432;Database=chamudb;username=postgres;password=root";
            DataSet ds = null;
            NpgsqlCommand cmd = null;
            NpgsqlDataAdapter da1 = null, da2 = null;

            try
            {
                conn = new NpgsqlConnection(cs);
                conn.Open();

                Console.WriteLine("Conn Opened Successfully");



                //create an empty data set 
                ds = new DataSet();

                //Create an adapter
                da1 = new NpgsqlDataAdapter("select * from emp", conn);

                da2 = new NpgsqlDataAdapter("select * from dept", conn);
                da2.Fill(ds, "depts");


                da3=new NpgsqlDataAdapter("create table payload(empno int,month int,year int,attendance int,basic numeric,takehome numeric)",conn);
                da3.SelectCommand =cmd;
                da1.fill(ds.payload);

                Console.WriteLine("Data Set created with tables Successfully");
                //read all data tables
                foreach (DataTable dt in ds.Tables)
                {

                    Console.WriteLine("=====Table Name : " + dt.TableName + "=====");

                    //read all columns
                    Console.WriteLine("-----------Columns-----------");
                    foreach (DataColumn dc in dt.Columns)
                    {
                        Console.WriteLine(dc.ColumnName);
                    }

                    //read the data from each table
                    Console.WriteLine("-----------Data of the Table-----------");
                    foreach (DataRow dr in dt.Rows)
                    {
                        Console.WriteLine(dr[0] + "-" + dr[1]);
                    }
                }


            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
}
