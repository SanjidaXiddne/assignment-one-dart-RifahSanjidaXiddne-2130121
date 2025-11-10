// Question 4: Inheritance & Polymorphism (Difficulty: 4/5) ⭐⭐⭐⭐

// 1. Abstract Class Vehicle:
//    - Properties: String brand, String model, int year
//    - Abstract method: void start()
//    - Abstract method: void stop()
//    - Concrete method: void displayInfo()
abstract class Vehicle {
  String brand;
  String model;
  int year;
  
  Vehicle(this.brand, this.model, this.year);
  
  // Abstract methods
  void start();
  void stop();
  
  // Concrete method
  void displayInfo() {
    print("Vehicle Info: $year $brand $model");
  }
  
  // Calculate vehicle age (current year - vehicle year)
  int calculateAge() {
    return DateTime.now().year - year;
  }
}

// 2. Concrete Classes:
//    - Car extends Vehicle
//      - Additional property: int numberOfDoors
//      - Override start() and stop() methods
class Car extends Vehicle {
  int numberOfDoors;
  
  Car(String brand, String model, int year, this.numberOfDoors) : super(brand, model, year);
  
  @override
  void start() {
    print("Starting the car engine for $brand $model...");
  }
  
  @override
  void stop() {
    print("Stopping the car engine for $brand $model...");
  }
  
  @override
  void displayInfo() {
    print("Vehicle Info: $year $brand $model ($numberOfDoors doors)");
  }
}

//    - Motorcycle extends Vehicle
//      - Additional property: bool hasWindshield
//      - Override start() and stop() methods
class Motorcycle extends Vehicle {
  bool hasWindshield;
  
  Motorcycle(String brand, String model, int year, this.hasWindshield) : super(brand, model, year);
  
  @override
  void start() {
    print("Starting the motorcycle engine for $brand $model...");
  }
  
  @override
  void stop() {
    print("Stopping the motorcycle engine for $brand $model...");
  }
  
  @override
  void displayInfo() {
    print("Vehicle Info: $year $brand $model (Has windshield: $hasWindshield)");
  }
}

void main() {
  // 3. Create a list of vehicles and demonstrate polymorphism
  List<Vehicle> vehicles = [
    Car("Toyota", "Camry", 2020, 4),
    Motorcycle("Honda", "CBR600RR", 2021, true),
    Car("Ford", "Mustang", 2018, 2),
  ];
  
  // Demonstrate polymorphism: call displayInfo(), start(), stop(), and calculateAge()
  for (Vehicle vehicle in vehicles) {
    vehicle.displayInfo();
    vehicle.start();
    vehicle.stop();
    print("${vehicle.brand} ${vehicle.model} age: ${vehicle.calculateAge()} years\n");
  }
}
