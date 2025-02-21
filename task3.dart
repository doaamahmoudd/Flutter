import'dart:io';

void main()
{
  int seats=12;
  int remaining= seats;
  while(true)
  {
    
    print("Enter the group size:");
    int? NumOfGroup=int.parse(stdin.readLineSync()!);
    
    if(NumOfGroup==0)
    {
      print("All buses are handled.");
      break;
    }
    else if(NumOfGroup<=remaining)
    {
      remaining-=NumOfGroup;
      print("Seats remaining: $remaining");
      
    }
    else if(NumOfGroup>remaining)
    {
      print("Not enough seats! Moving to the next bus.");
      print("  New Bus Started ");
      int remaining=seats-NumOfGroup;
      print("Seats remaining: $remaining");
    }
  }
}