// Question 3: Classes & Objects (Difficulty: 3/5) ⭐⭐⭐

// Create a BankAccount class with the following specifications:
class BankAccount {
  // 1. Properties:
  String accountNumber;
  String accountHolder;
  double balance;
  String accountType; // Savings/Checking
  
  // 2. Constructor:
  // Initialize all properties, set initial balance to 0.0
  BankAccount(this.accountNumber, this.accountHolder, this.accountType)
      : balance = 0.0;
  
  // 3. Methods:
  // deposit(double amount): Add money to account
  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      print("✅ Deposited \$${amount.toStringAsFixed(2)} to $accountHolder's account.");
    } else {
      print("⚠️ Deposit amount must be positive.");
    }
  }
  
  // withdraw(double amount): Remove money from account (check for sufficient funds)
  void withdraw(double amount) {
    if (amount <= 0) {
      print("⚠️ Withdrawal amount must be positive.");
    } else if (amount > balance) {
      print("❌ Insufficient funds! Cannot withdraw \$${amount.toStringAsFixed(2)} from $accountHolder's account.");
    } else {
      balance -= amount;
      print("💸 Withdrawn \$${amount.toStringAsFixed(2)} from $accountHolder's account.");
    }
  }
  
  // getBalance(): Return current balance
  double getBalance() {
    return balance;
  }
  
  // displayAccountInfo(): Show account details
  void displayAccountInfo() {
    print("\n🏦 Account Information:");
    print("Account Holder: $accountHolder");
    print("Account Number: $accountNumber");
    print("Account Type: $accountType");
    print("Current Balance: \$${balance.toStringAsFixed(2)}");
  }
}

void main() {
  // 4. Create 3 bank accounts and demonstrate:
  BankAccount account1 = BankAccount("12345", "Alice", "Savings");
  BankAccount account2 = BankAccount("67890", "Bob", "Checking");
  BankAccount account3 = BankAccount("11111", "Charlie", "Savings");
  
  // Demonstrate depositing money
  account1.deposit(1000.0);
  account2.deposit(500.0);
  account3.deposit(2000.0);
  
  // Demonstrate withdrawing money
  account1.withdraw(200.0);
  account2.withdraw(100.0);
  
  // Display account information
  account1.displayAccountInfo();
  account2.displayAccountInfo();
  account3.displayAccountInfo();
  
  // Demonstrate insufficient funds scenario
  account2.withdraw(1000.0); // Should show insufficient funds message
}
