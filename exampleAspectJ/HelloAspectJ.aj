public aspect HelloAspectJ {	
    // Define a Pointcut is
    // collection of JoinPoint 
	// call say* of class HelloAspectJDemo.
   
	
	//pointcut callSaysayGreeting(): call(* *.say*()); 
    before() : callSaysayGreeting() {
        System.out.println("Before call say");
    } 
   // pointcut callBye(): call(* *.sayHello()); 
    after() : callBye()  {
        System.out.println("After call say");
    }  
}  

