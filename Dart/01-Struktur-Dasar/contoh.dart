// ========================================
// CONTOH STRUKTUR DASAR DART
// ========================================

void main() {
  print('=== CONTOH STRUKTUR DASAR DART ===\n');

  // 1. VARIABEL DAN TIPE DATA
  contohVariabel();

  // 2. OPERATOR
  contohOperator();

  // 3. CONTROL FLOW
  contohControlFlow();

  // 4. FUNCTION
  contohFunction();

  // 5. COLLECTIONS
  contohCollections();

  // 6. NULL SAFETY
  contohNullSafety();
}

// ========================================
// 1. VARIABEL DAN TIPE DATA
// ========================================
void contohVariabel() {
  print('\n--- 1. VARIABEL DAN TIPE DATA ---');

  // Deklarasi variabel
  var name = 'John Doe'; // Type inference
  String city = 'Jakarta'; // Explicit type
  final birthYear = 1990; // Runtime constant
  const pi = 3.14159; // Compile-time constant

  // Tipe data numbers
  int age = 25;
  double height = 175.5;
  num weight = 70; // bisa int atau double

  // String
  String greeting = 'Hello';
  String multiline = '''
    Ini adalah
    string multiline
    di Dart
  ''';

  // String interpolation
  String info = 'Name: $name, Age: $age, City: $city';
  String calculation = 'Next year age: ${age + 1}';

  // Boolean
  bool isStudent = true;
  bool hasGraduated = false;

  print('Name: $name');
  print('City: $city');
  print('Birth Year: $birthYear');
  print('Pi: $pi');
  print('Info: $info');
  print('Calculation: $calculation');
  print('Is Student: $isStudent');
}

// ========================================
// 2. OPERATOR
// ========================================
void contohOperator() {
  print('\n--- 2. OPERATOR ---');

  // Arithmetic operators
  int a = 10, b = 3;
  print('a + b = ${a + b}'); // 13
  print('a - b = ${a - b}'); // 7
  print('a * b = ${a * b}'); // 30
  print('a / b = ${a / b}'); // 3.333...
  print('a ~/ b = ${a ~/ b}'); // 3 (integer division)
  print('a % b = ${a % b}'); // 1 (modulo)

  // Comparison operators
  print('\na == b: ${a == b}'); // false
  print('a != b: ${a != b}'); // true
  print('a > b: ${a > b}'); // true
  print('a < b: ${a < b}'); // false

  // Logical operators
  bool x = true, y = false;
  print('\nx && y: ${x && y}'); // false
  print('x || y: ${x || y}'); // true
  print('!x: ${!x}'); // false

  // Ternary operator
  int age = 20;
  String status = age >= 18 ? 'Dewasa' : 'Anak-anak';
  print('\nStatus: $status');

  // Null-aware operators
  String? nullableName;
  String displayName = nullableName ?? 'Guest';
  print('Display Name: $displayName');

  nullableName = 'Alice';
  int? nameLength = nullableName?.length;
  print('Name Length: $nameLength');
}

// ========================================
// 3. CONTROL FLOW
// ========================================
void contohControlFlow() {
  print('\n--- 3. CONTROL FLOW ---');

  // If-Else
  int score = 85;
  print('Score: $score');
  if (score >= 90) {
    print('Grade: A');
  } else if (score >= 80) {
    print('Grade: B');
  } else if (score >= 70) {
    print('Grade: C');
  } else {
    print('Grade: D');
  }

  // Switch
  String day = 'Monday';
  print('\nDay: $day');
  switch (day) {
    case 'Monday':
    case 'Tuesday':
    case 'Wednesday':
    case 'Thursday':
    case 'Friday':
      print('Weekday');
      break;
    case 'Saturday':
    case 'Sunday':
      print('Weekend');
      break;
    default:
      print('Invalid day');
  }

  // For loop
  print('\nFor loop (0-4):');
  for (int i = 0; i < 5; i++) {
    print('  i = $i');
  }

  // For-in loop
  List<String> fruits = ['Apple', 'Banana', 'Orange'];
  print('\nFruits:');
  for (var fruit in fruits) {
    print('  - $fruit');
  }

  // While loop
  print('\nWhile loop countdown:');
  int count = 5;
  while (count > 0) {
    print('  $count');
    count--;
  }

  // Do-while loop
  print('\nDo-While loop:');
  int num = 1;
  do {
    print('  Number: $num');
    num++;
  } while (num <= 3);

  // Break and Continue
  print('\nBreak and Continue example:');
  for (int i = 1; i <= 10; i++) {
    if (i == 3) continue; // Skip 3
    if (i == 8) break; // Stop at 8
    print('  $i');
  }
}

// ========================================
// 4. FUNCTION
// ========================================
void contohFunction() {
  print('\n--- 4. FUNCTION ---');

  // Basic function
  int result1 = tambah(5, 3);
  print('5 + 3 = $result1');

  // Arrow function
  int result2 = kali(4, 7);
  print('4 * 7 = $result2');

  // Function dengan named parameters
  printPerson(name: 'Alice', age: 25, city: 'Jakarta');

  // Function dengan optional parameters
  greet('Bob');
  greet('Charlie', 'Mr.');

  // Function dengan default values
  calculateArea(width: 10); // height default = 5
  calculateArea(width: 10, height: 8);

  // Anonymous function
  var numbers = [1, 2, 3, 4, 5];
  print('\nSquare of numbers:');
  numbers.forEach((n) {
    print('  $n² = ${n * n}');
  });

  // Higher order function
  var doubled = applyOperation(numbers, (n) => n * 2);
  print('\nDoubled: $doubled');
}

// Basic function
int tambah(int a, int b) {
  return a + b;
}

// Arrow function
int kali(int a, int b) => a * b;

// Named parameters
void printPerson({required String name, required int age, String? city}) {
  print('\nPerson: $name, Age: $age, City: ${city ?? "Unknown"}');
}

// Optional positional parameters
void greet(String name, [String? title]) {
  if (title != null) {
    print('Hello, $title $name');
  } else {
    print('Hello, $name');
  }
}

// Default parameter values
void calculateArea({required double width, double height = 5.0}) {
  double area = width * height;
  print('Area: $width x $height = $area');
}

// Higher order function
List<int> applyOperation(List<int> list, int Function(int) operation) {
  return list.map(operation).toList();
}

// ========================================
// 5. COLLECTIONS
// ========================================
void contohCollections() {
  print('\n--- 5. COLLECTIONS ---');

  // LIST
  print('\nLIST:');
  List<String> fruits = ['Apple', 'Banana', 'Orange'];
  print('Fruits: $fruits');
  print('First fruit: ${fruits[0]}');
  print('Length: ${fruits.length}');

  fruits.add('Mango');
  print('After add: $fruits');

  fruits.remove('Banana');
  print('After remove: $fruits');

  // List methods
  var numbers = [5, 2, 8, 1, 9];
  print('\nNumbers: $numbers');
  print('Sorted: ${[...numbers]..sort()}');
  print('Reversed: ${numbers.reversed.toList()}');
  print('First: ${numbers.first}');
  print('Last: ${numbers.last}');

  // Spread operator
  var moreFruits = ['Grape', ...fruits, 'Melon'];
  print('\nMore fruits: $moreFruits');

  // Collection if
  bool showPromo = true;
  var menuItems = ['Home', 'Products', if (showPromo) 'Promo', 'About'];
  print('Menu: $menuItems');

  // Collection for
  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  print('List of strings: $listOfStrings');

  // SET
  print('\nSET:');
  Set<String> uniqueNames = {'Alice', 'Bob', 'Charlie'};
  print('Unique names: $uniqueNames');

  uniqueNames.add('Alice'); // Tidak akan ditambahkan (duplikat)
  print('After add duplicate: $uniqueNames');

  uniqueNames.add('David');
  print('After add David: $uniqueNames');

  // MAP
  print('\nMAP:');
  Map<String, int> scores = {'Alice': 90, 'Bob': 85, 'Charlie': 95};
  print('Scores: $scores');
  print('Alice score: ${scores['Alice']}');

  scores['David'] = 88;
  scores['Alice'] = 92; // Update
  print('Updated scores: $scores');

  print('Keys: ${scores.keys}');
  print('Values: ${scores.values}');

  // Iterate map
  print('All scores:');
  scores.forEach((name, score) {
    print('  $name: $score');
  });
}

// ========================================
// 6. NULL SAFETY
// ========================================
void contohNullSafety() {
  print('\n--- 6. NULL SAFETY ---');

  // Non-nullable
  String name = 'John';
  print('Name: $name');
  // name = null; // ERROR! Cannot assign null to non-nullable

  // Nullable
  String? nullableName;
  print('Nullable name (initial): $nullableName');

  nullableName = 'Jane';
  print('Nullable name (assigned): $nullableName');

  nullableName = null;
  print('Nullable name (null): $nullableName');

  // Null coalescing operator (??)
  String? username;
  String displayName = username ?? 'Guest';
  print('Display name: $displayName');

  // Null-aware access operator (?.)
  String? text;
  int? length = text?.length;
  print('Text length: $length');

  text = 'Hello';
  length = text?.length;
  print('Text "$text" length: $length');

  // Null assertion operator (!)
  String? confirmedName = 'Alice';
  // Gunakan dengan hati-hati! Akan throw error jika null
  String upperName = confirmedName!.toUpperCase();
  print('Upper name: $upperName');

  // Null-aware assignment (??=)
  String? message;
  print('Message before ??=: $message');
  message ??= 'Default message'; // Assign hanya jika null
  print('Message after ??=: $message');
  message ??= 'Another message'; // Tidak akan di-assign (sudah ada nilai)
  print('Message after second ??=: $message');

  // Late variables
  late String description;
  description = 'This is initialized later';
  print('Late description: $description');

  // Null check with if
  String? optionalValue = 'Value exists';
  if (optionalValue != null) {
    // Inside this block, optionalValue is promoted to non-nullable
    print('Length: ${optionalValue.length}');
  }
}
