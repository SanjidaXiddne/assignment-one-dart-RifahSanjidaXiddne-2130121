// Question 1: Basic Data Types & Functions (Difficulty: 1/5) ⭐
// TODO: Complete the following requirements:

// 1. Create variables of different data types: String, int, double, bool
String name = ""; 
int age = 0; 
double height = 0.0; 
bool isStudent = false;

// 2. Write a function called calculateBMI that takes weight (double) and height (double) as parameters and returns the BMI as a double
double calculateBMI(double weight, double height) {
  // BMI = weight / (height * height)
  return weight / (height * height);
}

// 3. Write a function called getGrade that takes a score (int) and returns a grade (String)
String getGrade(int score) {
  if (score >= 90 && score <= 100) {
    return "A";
  } else if (score >= 80 && score <= 89) {
    return "B";
  } else if (score >= 70 && score <= 79) {
    return "C";
  } else if (score >= 60 && score <= 69) {
    return "D";
  } else {
    return "F";
  }
}

void main() {
  // Initialize variables
  name = "John Doe";
  age = 25;
  height = 1.75; // height in meters (for BMI calculation)
  isStudent = true;
  
  // Calculate BMI and grade
  double bmi = calculateBMI(68.0, height); // Example: 68 kg, 1.75 m
  String grade = getGrade(85); // Example score
  
  // Display results
  print("Name: $name, Age: $age, Height: $height m, Is Student: $isStudent");
  print("BMI: ${bmi.toStringAsFixed(2)}");
  print("Grade: $grade");
}
