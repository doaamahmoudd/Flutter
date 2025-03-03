import'dart:io';

void main()
{
  Map<String,int> grades={};
  

  while(true)
  {
    stdout.write("Enter student name(or 'done' to finish):");
    String name=stdin.readLineSync()!.trim();

  if(name=="done")break;
  int? grade;
  while(true)
  {
    stdout.write("Enter $name's grade:");
    String Grade=stdin.readLineSync()!.trim();
    try {
          grade=int.parse(Grade);
          if (grade < 0 || grade > 100)
          {
            print("Invalid grade....");
            continue;
          }
          break;
        } 
        catch (e) {
          print("Please enter a valid numeric grade...");
        }
  }
  grades[name]=grade;
  }
  var studentsgrade = grades.entries.toList()
  ..sort((a, b) => b.value.compareTo(a.value));

  var highestGrade = studentsgrade.first;
  var lowestGrade = studentsgrade.last;

  print("Highest Grade:${highestGrade.value} (${highestGrade.key})");
  print("Lowest Grade:${lowestGrade.value} (${lowestGrade.key})");

  double averageGrade = grades.values.reduce((a, b) => a + b) /grades.length;

  var averageStudents = studentsgrade.where((entry) => entry.value > averageGrade).map((entry) => entry.key).toList();

  print("Average Grade:$averageGrade");

  print("Sorted Grades (High to Low): {${studentsgrade.map((e) => '${e.key} (${e.value})').join(', ')}}");
  print("Above Average Students: ${averageStudents.isNotEmpty ? averageStudents.join(', ') : 'None'}");

  if (grades.isEmpty)
  {
    print("No student data entered.");
    return;
  }
}