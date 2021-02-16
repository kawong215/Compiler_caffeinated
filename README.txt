Project Name: Caffeinated
Fall 2019


To run the compiler, we used Eclipse. It requires wci (from Pcl2), jasmin-2.4 and PascalRTL.


To select the source program to create a Jasmin file for, we had to change the argument in <Run Configurations> to the file name. When we build and run, the .j file should be generated automatically. 

In the terminal, to get the .class file, we would run the command:  
    java -jar jasmin-2.4/jasmin.jar [program_name].j



To compile and execute the .class file, run the command:

    java -cp .:PascalRTL.jar [program_name]



** Remove the brackets around program_name, and put the appropriate source program name