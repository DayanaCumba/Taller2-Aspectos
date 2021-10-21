import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;

import org.aspectj.lang.reflect.Pointcut;

public aspect Log {

	File file =new File("Log.txt");
	//FileWriter escritor=null;
    Calendar cal = Calendar.getInstance();
    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
    pointcut success() : call(* money*(..) );
    
    after() throws IOException : success() {
    	
    	FileWriter archivo= null;
    	String metodo=thisJoinPoint.getSignature().getName();
    	Date fecha=cal.getTime();
    	String mensaje=null;
    	try {
    	archivo= new FileWriter("Log.txt");
    	if("moneyMakeTransaction".equals(metodo)) {
    		mensaje= "Transacción realizada"+" "+fecha;
    		archivo.write(mensaje+"\n");
        	System.out.println(mensaje+"\n");
    	}
    	else if("moneyWithdrawal".equals(metodo)){
    		mensaje="Retiro realizado"+" "+fecha;
    		archivo.write(mensaje+"\n");
        	System.out.println(mensaje+"\n");
    	}
    	
    	
    	}
    	catch (Exception e) {
    	System.out.println("Error: "+e.getMessage());

    	}
    	finally{
    	archivo.close();
    	}
    	
    }
	}
