import'dart:io';

void main()
{
  stdout.write("Enter the dividend:");
  double? dividend=double.parse(stdin.readLineSync()!);
  stdout.write("Enter the divisor:");
  double? divisor=double.parse(stdin.readLineSync()!);

  print( safeDivide(dividend,divisor));
}

safeDivide(double a,double b)
{
  double division=a/b;
  try
  {
    if(b==0||b==null)
    {print("Cannot divide by zero!");}
  }catch(e)
  {print("Cannot divide by zero!");}
  return division;
}