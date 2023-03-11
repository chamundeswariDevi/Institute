using System;  
using System.IO;  
using System.Collections.Generic;
using System.Runtime.Serialization;  
using System.Runtime.Serialization.Formatters.Binary;  
public class SerializeEx2{  

    public void SerializeNow() {  

	//File to write serialized content  	
	//Open to create if not existing
        Stream str = File.Open("actinfo.dat",FileMode.Create);  
	
	//Code to serialize
        list<Account>  la=new list<Account>();
	
        BinaryFormatter b = new BinaryFormatter();  
        b.Serialize(str, a);  

	Console.WriteLine("Successfully Serialized");
        str.Close();  
    }  
    public static void Main(string[] s) {  
        SerializeEx2 sa = new SerializeEx2();  
        sa.SerializeNow();  
        
    }  