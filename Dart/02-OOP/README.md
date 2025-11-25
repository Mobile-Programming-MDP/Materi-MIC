# Object-Oriented Programming (OOP) dengan Dart

## Daftar Isi
1. [Pengenalan OOP](#pengenalan-oop)
2. [Class dan Object](#class-dan-object)
3. [Constructor](#constructor)
4. [Properties dan Methods](#properties-dan-methods)
5. [Encapsulation](#encapsulation)
6. [Inheritance (Pewarisan)](#inheritance-pewarisan)
7. [Polymorphism](#polymorphism)
8. [Abstraction](#abstraction)
9. [Interface](#interface)
10. [Mixin](#mixin)
11. [Extension Methods](#extension-methods)

---

## Pengenalan OOP

Object-Oriented Programming (OOP) adalah paradigma pemrograman yang mengorganisir kode ke dalam objek-objek yang merepresentasikan entitas dunia nyata. OOP di Dart memiliki 4 pilar utama:

1. **Encapsulation** - Menyembunyikan detail implementasi
2. **Inheritance** - Mewarisi sifat dari class lain
3. **Polymorphism** - Kemampuan objek mengambil banyak bentuk
4. **Abstraction** - Menyederhanakan kompleksitas

---

## Class dan Object

### Class
Class adalah blueprint atau template untuk membuat objek. Class mendefinisikan properties (data) dan methods (perilaku).

```dart
class Mobil {
  // Properties
  String merk;
  String model;
  int tahun;

  // Constructor
  Mobil(this.merk, this.model, this.tahun);

  // Method
  void info() {
    print('$merk $model ($tahun)');
  }
}
```

### Object
Object adalah instance dari class.

```dart
void main() {
  // Membuat object
  Mobil mobil1 = Mobil('Toyota', 'Avanza', 2023);
  Mobil mobil2 = Mobil('Honda', 'Civic', 2022);

  mobil1.info();  // Toyota Avanza (2023)
  mobil2.info();  // Honda Civic (2022)
}
```

---

## Constructor

Constructor adalah method khusus yang dipanggil saat object dibuat.

### Default Constructor

```dart
class Person {
  String name;
  int age;

  // Default constructor
  Person(this.name, this.age);
}
```

### Named Constructor

```dart
class Point {
  double x;
  double y;

  Point(this.x, this.y);

  // Named constructor
  Point.origin() : x = 0, y = 0;
  
  Point.fromMap(Map<String, double> map)
      : x = map['x'] ?? 0,
        y = map['y'] ?? 0;
}

void main() {
  var p1 = Point(5, 10);
  var p2 = Point.origin();
  var p3 = Point.fromMap({'x': 3, 'y': 7});
}
```

### Constructor dengan Named Parameters

```dart
class User {
  String name;
  int age;
  String? email;

  User({
    required this.name,
    required this.age,
    this.email,
  });
}

void main() {
  var user = User(name: 'Alice', age: 25, email: 'alice@email.com');
}
```

### Initializer List

```dart
class Rectangle {
  final double width;
  final double height;
  final double area;

  // Initializer list
  Rectangle(this.width, this.height)
      : area = width * height;
}
```

---

## Properties dan Methods

### Instance Variables (Properties)

```dart
class BankAccount {
  String accountNumber;
  double balance;

  BankAccount(this.accountNumber, this.balance);
}
```

### Getters dan Setters

```dart
class Circle {
  double _radius;  // Private property

  Circle(this._radius);

  // Getter
  double get radius => _radius;
  double get area => 3.14 * _radius * _radius;
  double get circumference => 2 * 3.14 * _radius;

  // Setter
  set radius(double value) {
    if (value > 0) {
      _radius = value;
    }
  }
}
```

### Instance Methods

```dart
class Calculator {
  int add(int a, int b) => a + b;
  int subtract(int a, int b) => a - b;
  int multiply(int a, int b) => a * b;
  double divide(int a, int b) => a / b;
}
```

### Static Members

```dart
class MathUtils {
  static const double pi = 3.14159;
  
  static double circleArea(double radius) {
    return pi * radius * radius;
  }
}

void main() {
  print(MathUtils.pi);
  print(MathUtils.circleArea(5));
}
```

---

## Encapsulation

Encapsulation adalah menyembunyikan detail implementasi dan hanya mengekspos interface yang diperlukan.

```dart
class BankAccount {
  String _accountNumber;  // Private (dimulai dengan _)
  double _balance;

  BankAccount(this._accountNumber, this._balance);

  // Public getter
  double get balance => _balance;

  // Public methods
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('Deposit: $amount. New balance: $_balance');
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print('Withdraw: $amount. New balance: $_balance');
    } else {
      print('Insufficient balance');
    }
  }

  // Private method
  void _logTransaction(String type, double amount) {
    print('[$type] $amount');
  }
}
```

**Catatan:** Di Dart, privacy adalah pada level library (file), bukan class.

---

## Inheritance (Pewarisan)

Inheritance memungkinkan class untuk mewarisi properties dan methods dari class lain.

### Basic Inheritance

```dart
// Parent class (superclass)
class Animal {
  String name;
  int age;

  Animal(this.name, this.age);

  void eat() {
    print('$name is eating');
  }

  void sleep() {
    print('$name is sleeping');
  }
}

// Child class (subclass)
class Dog extends Animal {
  String breed;

  Dog(String name, int age, this.breed) : super(name, age);

  void bark() {
    print('$name is barking: Woof! Woof!');
  }
}

void main() {
  var dog = Dog('Buddy', 3, 'Golden Retriever');
  dog.eat();    // Inherited from Animal
  dog.sleep();  // Inherited from Animal
  dog.bark();   // Dog's own method
}
```

### Override Methods

```dart
class Cat extends Animal {
  Cat(String name, int age) : super(name, age);

  @override
  void eat() {
    print('$name is eating fish');
  }

  void meow() {
    print('$name is meowing: Meow!');
  }
}
```

### Super Keyword

```dart
class Employee {
  String name;
  double salary;

  Employee(this.name, this.salary);

  void displayInfo() {
    print('Employee: $name, Salary: $salary');
  }
}

class Manager extends Employee {
  String department;

  Manager(String name, double salary, this.department)
      : super(name, salary);

  @override
  void displayInfo() {
    super.displayInfo();  // Call parent method
    print('Department: $department');
  }
}
```

---

## Polymorphism

Polymorphism memungkinkan objek untuk mengambil banyak bentuk.

### Method Overriding

```dart
class Shape {
  void draw() {
    print('Drawing a shape');
  }

  double area() => 0;
}

class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  void draw() {
    print('Drawing a circle');
  }

  @override
  double area() => 3.14 * radius * radius;
}

class Rectangle extends Shape {
  double width, height;

  Rectangle(this.width, this.height);

  @override
  void draw() {
    print('Drawing a rectangle');
  }

  @override
  double area() => width * height;
}

void main() {
  List<Shape> shapes = [
    Circle(5),
    Rectangle(4, 6),
  ];

  for (var shape in shapes) {
    shape.draw();
    print('Area: ${shape.area()}');
  }
}
```

---

## Abstraction

Abstraction adalah menyembunyikan kompleksitas dan hanya menampilkan fitur penting.

### Abstract Class

```dart
abstract class Vehicle {
  String name;

  Vehicle(this.name);

  // Abstract method (tidak ada implementasi)
  void start();
  void stop();

  // Concrete method
  void displayName() {
    print('Vehicle: $name');
  }
}

class Car extends Vehicle {
  Car(String name) : super(name);

  @override
  void start() {
    print('$name is starting with ignition key');
  }

  @override
  void stop() {
    print('$name is stopping');
  }
}

class Motorcycle extends Vehicle {
  Motorcycle(String name) : super(name);

  @override
  void start() {
    print('$name is starting with kick start');
  }

  @override
  void stop() {
    print('$name is stopping');
  }
}
```

**Catatan:** Abstract class tidak bisa diinstansiasi langsung.

---

## Interface

Di Dart, setiap class secara implisit mendefinisikan interface. Gunakan `implements` untuk mengimplementasikan interface.

```dart
class Flyable {
  void fly() {
    print('Flying');
  }
}

class Swimmable {
  void swim() {
    print('Swimming');
  }
}

// Implements multiple interfaces
class Duck implements Flyable, Swimmable {
  @override
  void fly() {
    print('Duck is flying');
  }

  @override
  void swim() {
    print('Duck is swimming');
  }
}

void main() {
  var duck = Duck();
  duck.fly();
  duck.swim();
}
```

### Perbedaan `extends` vs `implements`

- **extends**: Mewarisi implementasi dari parent class
- **implements**: Harus mengimplementasikan semua methods dari interface

---

## Mixin

Mixin adalah cara untuk menggunakan kembali kode class di multiple class hierarchies.

```dart
mixin Flyable {
  void fly() {
    print('Flying in the sky');
  }
}

mixin Swimmable {
  void swim() {
    print('Swimming in water');
  }
}

mixin Walkable {
  void walk() {
    print('Walking on ground');
  }
}

class Bird with Flyable, Walkable {
  String name;
  Bird(this.name);
}

class Fish with Swimmable {
  String name;
  Fish(this.name);
}

class Duck with Flyable, Swimmable, Walkable {
  String name;
  Duck(this.name);
}

void main() {
  var bird = Bird('Sparrow');
  bird.fly();
  bird.walk();

  var duck = Duck('Donald');
  duck.fly();
  duck.swim();
  duck.walk();
}
```

### Mixin dengan `on` Clause

```dart
class Animal {
  String name;
  Animal(this.name);
}

mixin CanFly on Animal {
  void fly() {
    print('$name is flying');
  }
}

class Bird extends Animal with CanFly {
  Bird(String name) : super(name);
}
```

---

## Extension Methods

Extension methods memungkinkan menambahkan methods ke existing class tanpa inheritance.

```dart
extension StringExtension on String {
  // Capitalize first letter
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  // Check if palindrome
  bool get isPalindrome {
    String cleaned = toLowerCase().replaceAll(' ', '');
    return cleaned == cleaned.split('').reversed.join('');
  }
}

extension IntExtension on int {
  // Check if even
  bool get isEven => this % 2 == 0;

  // Check if odd
  bool get isOdd => this % 2 != 0;

  // Factorial
  int get factorial {
    if (this < 0) return -1;
    if (this == 0) return 1;
    int result = 1;
    for (int i = 1; i <= this; i++) {
      result *= i;
    }
    return result;
  }
}

void main() {
  print('hello'.capitalize());        // Hello
  print('radar'.isPalindrome);        // true
  
  print(4.isEven);      // true
  print(5.isOdd);       // true
  print(5.factorial);   // 120
}
```

---

## Best Practices OOP

1. **Single Responsibility Principle**: Setiap class harus memiliki satu tanggung jawab
2. **Gunakan Encapsulation**: Private properties dengan public getters/setters
3. **Prefer Composition over Inheritance**: Gunakan composition jika memungkinkan
4. **Use Abstract Classes**: Untuk mendefinisikan contract
5. **Use Mixins**: Untuk code reusability tanpa inheritance
6. **Named Constructors**: Untuk membuat object dengan cara berbeda
7. **Const Constructors**: Untuk immutable objects
8. **Override toString()**: Untuk debugging yang lebih baik

```dart
class Person {
  final String name;
  final int age;

  const Person(this.name, this.age);

  @override
  String toString() => 'Person(name: $name, age: $age)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Person && name == other.name && age == other.age;

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}
```

---

## Lihat Juga

- [Contoh Script](./contoh.dart) - Implementasi lengkap konsep OOP
- [Latihan Soal](./latihan.md) - Soal latihan OOP
- [Jawaban Latihan](./jawaban.dart) - Script jawaban latihan OOP
