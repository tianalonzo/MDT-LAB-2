import 'dart:io';
class Student {
  String fullName;
  String idNumber;
  List<double> grades;

  Student({
    required this.fullName,
    required this.idNumber,
    required this.grades,
  });

  void displayInfo() {
    print('          STUDENT GRADE REPORT          ');
    print('Student Name : $fullName');
    print('ID Number    : $idNumber');
    print('Subject Grades:');
    
    for (int i = 0; i < grades.length; i++) {
      print('  Subject ${i + 1}: ${grades[i].toStringAsFixed(2)}');
    }
  }
}

String computeGrade(List<double> grades) {
  if (grades.isEmpty) return 'No grades available';

  double sum = 0;
  for (double grade in grades) {
    sum += grade;
  }
  double average = sum / grades.length;

  String status;

  if (average >= 75) {
    status = 'Passed';
  } else if (average >= 70) {
    status = 'Conditional';
  } else {
    status = 'Failed';
  }

  return 'Average: ${average.toStringAsFixed(2)} | Status: $status';
}

void main() {
  print('=== University Student Grade System ===\n');


  stdout.write('Enter Student Full Name: ');
  String fullName = stdin.readLineSync() ?? 'Unknown Student';

  stdout.write('Enter Student ID Number: ');
  String idNumber = stdin.readLineSync() ?? 'N/A';

  List<double> grades = [];


  for (int i = 1; i <= 3; i++) {
    stdout.write('Enter Grade for Subject $i: ');
    String? input = stdin.readLineSync();
    double grade = double.tryParse(input ?? '') ?? 0.0;
    grades.add(grade);
  }

  Student student = Student(
    fullName: fullName,
    idNumber: idNumber,
    grades: grades,
  );

  student.displayInfo();

  String gradeResult = computeGrade(student.grades);
  print('Final Evaluation: $gradeResult');
}