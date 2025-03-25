import 'dart:io';
import 'dart:convert';

void main()
{
  StudentManager manager=StudentManager();
  
  while(true)
  {
    print("Welcome to the Student Management System");
    print("1. Manage Students \n 2. Sort Students \n 3. Print Reports  \n 4. Exit");
    print("Enter your choice:");

    int choise=int.tryParse(stdin.readLineSync()?? '')?? 0;
    switch(choise)
    {
      case 1:
      manageStudents(manager);
      break;
      case 2:
      sortStudents(manager);
      break;
      case 3:
      printReports(manager);
      break;
      case 4:
      print("exiting....");
      return;
    }
  }

}


  class Person
{
  String name;
  int age;

  Person(this.name,this.age);

  @override
  String toString()
  {
    return "Person name:$name \n Person age:$age";
  }

  Map <String,dynamic> toJson()
  {
    return{
      "name":name,
      "age":age
    };
  }

  factory Person.fromJson(Map<String,dynamic> json)
  {
    return Person(json["name"],json["age"]);
  } 
}

class Student extends Person
{
  final String studentID;
  String gradeLevel;
  List<Subject> subjects=[];

  Student(String name,int age,this.studentID,this.gradeLevel) :super(name,age);

  void addSubject(Subject subject)
  {
    subjects.add(subject);
  }
  void removeSubject(String subjectName)
  {
    subjects.removeWhere((subject) => subject.name == subjectName);
  }
  void updateSubjectGrade(String subjectName, double newGrade)
  {
    for(var subject in subjects){
      if (subject.name == subjectName)
      {
        subject.updateGrade(newGrade);
        return;
      }
    }
  }

  double calculateAverage()
  {
    if (subjects.isEmpty) return 0.0; 
    return subjects.map((s) =>s.grade).reduce((a,b) => a+b)/subjects.length; 
  }

  @override
  String toString()
  {
    return "${super.toString()} \n Student ID:$studentID \n Grade level:$gradeLevel \n Subjects: ${subjects.join(" , ")}";
  }
}
class Subject
{
  String name;
  double grade;

  Subject(this.name,this.grade);

  @override
  String toString()
  {
    return "$name : $grade";
  }

  void updateGrade(double newGrade) 
  {
    grade = newGrade;
    print("update grade done....");
  }
}

class StudentManager
{
  List<Student> students=[];

  void addStudent(Student student)
  {
    students.add(student);
  }
  void removeStudent(String studentID)
  {
    students.removeWhere((s)=> s.studentID==studentID);
  }
  void updateStudent(String studentID, String newName, int newAge, String newGradeLevel)
  {
    for(var student in students)
    {
      if(student.studentID==studentID)
      {
        student.name=newName;
        student.age=newAge;
        student.gradeLevel=newGradeLevel;
        print("update done...");
      }
    }
  }
  Student? getStudent(String studentID)
  {
    return students.firstWhere((Student)=>Student.studentID==studentID);
  }
  void displayAllStudents()
  {
    for (var student in students)
    {
      print(student);
    }
  }
  void sortStudents(int sortType)
  {
    if(sortType==1)
    {students.sort((a,b)=>a.name.compareTo(b.name));}
    else if (sortType==2)
    {students.sort((a,b)=>a.age.compareTo(b.age));}
    else if (sortType==3)
    {students.sort((a,b)=>a.gradeLevel.compareTo(b.gradeLevel));}
  }
  
}


void manageStudents(StudentManager manager) {
  print("\nManage Students:");
  print("1. Add Student");
  print("2. Remove Student");
  print("3. Update Student");
  print("4. Back to Main Menu");
  print("Enter your choice:");

  int choice = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  if (choice == 1) {
    print("Enter student name:");
    String name = stdin.readLineSync() ?? '';
    print("Enter student age:");
    int age = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
    print("Enter student ID:");
    String studentID = stdin.readLineSync() ?? '';
    print("Enter grade level:");
    String gradeLevel = stdin.readLineSync() ?? '';
    manager.addStudent(Student(name, age, studentID, gradeLevel));
    print("done....");
  }
  else if (choice == 2) {
    print("Enter student ID to remove:");
    String idToRemove = stdin.readLineSync() ?? '';
    manager.removeStudent(idToRemove);
    print("Student removed ...");
  }
  else if (choice == 3) {
    print("Enter subject name to update:");
    String subjectToUpdate = stdin.readLineSync() ?? '';
    print("Enter new grade:");
    double newGrade = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;
    Student.updateSubjectGrade(subjectToUpdate, newGrade);
    print("done...");
    }
  
  } 

  void sortStudents(StudentManager manager) {
  Map<int, String> sortOptions = {
    1: "name",
    2: "age",
    3: "grade level"
  };

  print("Sort Students:");
  sortOptions.forEach((key, value) => print("$key. By $value"));
  print("Enter your choice:");

  int choice = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  
  
}

void printReports(StudentManager manager) {
  print("Student Reports:");
  for (var student in manager.students) {
    print(student);
    print("Average Grade: ${student.calculateAverage()}");
  }
}