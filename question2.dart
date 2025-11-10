import 'dart:math';

void main() {
  // 1. Create a List<String> of student names
  List<String> studentNames = ["Alice", "Bob", "Charlie", "Diana", "Eve"];
  
  // 2. Create a Map<String, int> to store student scores
  Map<String, int> studentScores = {};
  
  // 3. Use a for loop to assign random scores (60-100) to each student
  Random random = Random();
  for (String student in studentNames) {
    int score = random.nextInt(41) + 60; // 0..40 -> +60 => 60..100
    studentScores[student] = score;
  }
  
  // 4. Find and display highest, lowest, and average scores
  String highestStudent = "";
  int highestScore = -1;
  String lowestStudent = "";
  int lowestScore = 101;
  double averageScore = 0.0;
  
  int sum = 0;
  for (var entry in studentScores.entries) {
    String student = entry.key;
    int score = entry.value;
    sum += score;
    
    if (score > highestScore) {
      highestScore = score;
      highestStudent = student;
    }
    if (score < lowestScore) {
      lowestScore = score;
      lowestStudent = student;
    }
  }
  
  averageScore = studentScores.isNotEmpty ? sum / studentScores.length : 0.0;
  
  print("Student Scores: $studentScores");
  print("Highest Score: $highestStudent with $highestScore");
  print("Lowest Score: $lowestStudent with $lowestScore");
  print("Average Score: ${averageScore.toStringAsFixed(2)}");
  
  // 5. Use a switch statement to categorize students
  for (String student in studentNames) {
    int score = studentScores[student] ?? 0;
    String category = "";
    
    // switch on the tens place to group ranges
    switch (score ~/ 10) {
      case 10:
      case 9:
        category = "Excellent";
        break;
      case 8:
        category = "Good";
        break;
      case 7:
        category = "Average";
        break;
      default:
        category = "Needs Improvement";
    }
    
    print("$student: $score ($category)");
  }
}
