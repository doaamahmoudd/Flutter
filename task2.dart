import'dart:io';

void main()
{
  print("Enter the number of rows:");
  int? s=int.parse(stdin.readLineSync()!);
  for(int i=1;i<=s;i++)
  {
    for(int j=1;j<=i;j++)
    {
      stdout.write("* ");
    }
    print(" ");
  }
}