import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import org.aspectj.lang.reflect.Pointcut;

public aspect Log {

	File file =new File("Log.txt");
	//FileWriter escritor=null;
    Calendar cal = Calendar.getInstance();
    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
    pointcut success() : call(* money*(..) );
    after() : success() {
    	//CodeSignature codeSignature = (CodeSignature) joinPoint.getSignature();
    	//System.out.println(codeSignature);
    	try {
   		
   		
   		 FileWriter escritor= new FileWriter(file);
   		 escritor.write("escrito");
   		//escritor.println("Primera linea");
   		 
   		

   		}
   		catch (Exception e){
   		System.out.println("Error: "+e.getMessage());
   		}
   		finally {
   			//file
   		}
    	System.out.println("hola a todos");
    }
	}
