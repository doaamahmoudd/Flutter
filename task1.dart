import'dart:io';
void main()
{

  while(true){
    print("Enter first numder:"); 

    String? num1=stdin.readLineSync();
    if(num1 == "exit")
    {
      print("End the program ...");
      break;
    }

    double fn=double.parse(num1!);

    print("Enter second numder:");
    String? num2=stdin.readLineSync();
    if(num2 == "exit")
    {
      print("End the program ...");
      break;
    }
    double sn=double.parse(num2!);
  
    print("choose an operation(+,-,/,*)");
    String? op=stdin.readLineSync();
    switch(op)
    {
      case "+":
      print("Result:");
      print(fn+sn);
      break;

      case "-":
      print("Result:");
      print(fn-sn);
      break;

      case "*":
      print("Result:");
      print(fn*sn);
      break;

      case "/":
      if (sn==0)
      {
        print("Error:dividor must not be zero...");
      }else
      {
        print("Result:");
        print(fn/sn);
      }
      break;
    }
    }
}
