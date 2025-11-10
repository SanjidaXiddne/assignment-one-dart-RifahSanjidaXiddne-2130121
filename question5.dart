// Question 5: Advanced Features & Mixins (Difficulty: 5/5) ⭐⭐⭐⭐⭐

// 1. Mixin Payable:
mixin Payable {
  double calculateSalary(double baseSalary, double bonus) {
    // Calculate total salary (base + bonus)
    return baseSalary + bonus;
  }
  
  void processPayment(double amount) {
    // Process payment (here we just print confirmation)
    print("✅ Processed payment of \$${amount.toStringAsFixed(2)}");
  }
}

// 2. Mixin Reportable:
mixin Reportable {
  String generateReport(String employeeName, String department) {
    // Generate a simple report string
    return "Report for $employeeName (Department: $department)\n"
           "- Performance: Satisfactory\n"
           "- Summary: Managed team effectively and met goals.\n";
  }
}

// 3. Abstract Class Employee:
abstract class Employee {
  String name;
  String id;
  String department;
  
  Employee(this.name, this.id, this.department);
  
  String getJobTitle();
  double getBaseSalary();
  
  void displayInfo() {
    print("------ Employee Info ------");
    print("$name (ID: $id, Department: $department)");
    print("Job Title: ${getJobTitle()}");
    print("Base Salary: \$${getBaseSalary().toStringAsFixed(2)}");
  }
}

// 4. Concrete Classes:

// Manager extends Employee with Payable and Reportable
class Manager extends Employee with Payable, Reportable {
  int teamSize;
  
  Manager(String name, String id, String department, this.teamSize)
      : super(name, id, department);
  
  @override
  String getJobTitle() {
    return "Manager";
  }
  
  @override
  double getBaseSalary() {
    // example base salary for manager
    return 85000.0;
  }
  
  @override
  void displayInfo() {
    super.displayInfo();
    print("Team Size: $teamSize");
  }
}

// Developer extends Employee with Payable
class Developer extends Employee with Payable {
  String programmingLanguage;
  
  Developer(String name, String id, String department, this.programmingLanguage)
      : super(name, id, department);
  
  @override
  String getJobTitle() {
    return "Developer";
  }
  
  @override
  double getBaseSalary() {
    // example base salary for developer
    return 70000.0;
  }
  
  @override
  void displayInfo() {
    super.displayInfo();
    print("Programming Language: $programmingLanguage");
  }
}

void main() {
  // 5. Create employees and demonstrate functionality
  Manager manager = Manager("Alice Johnson", "M001", "Engineering", 6);
  Developer dev1 = Developer("Bob Smith", "D101", "Engineering", "Dart");
  Developer dev2 = Developer("Cara Lee", "D102", "Product", "JavaScript");
  
  // Salary calculation with bonus
  double managerBonus = 5000.0;
  double managerTotal = manager.calculateSalary(manager.getBaseSalary(), managerBonus);
  print("\nManager salary calculation:");
  print("Base: \$${manager.getBaseSalary().toStringAsFixed(2)}, Bonus: \$${managerBonus.toStringAsFixed(2)}");
  print("Total: \$${managerTotal.toStringAsFixed(2)}");
  
  // Process payment for manager
  manager.processPayment(managerTotal);
  
  // Generate manager report
  String report = manager.generateReport(manager.name, manager.department);
  print("\nManager Report:\n$report");
  
  // Developers salary calculations & payments
  double devBonus = 2000.0;
  for (var dev in [dev1, dev2]) {
    double total = dev.calculateSalary(dev.getBaseSalary(), devBonus);
    print("\nSalary for ${dev.name}: Base \$${dev.getBaseSalary().toStringAsFixed(2)}, Bonus \$${devBonus.toStringAsFixed(2)} -> Total \$${total.toStringAsFixed(2)}");
    dev.processPayment(total);
  }
  
  // Display all employee information
  print("\n=== All Employee Information ===");
  manager.displayInfo();
  print("");
  dev1.displayInfo();
  print("");
  dev2.displayInfo();
}
