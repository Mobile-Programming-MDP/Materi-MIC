// ========================================
// CONTOH OBJECT-ORIENTED PROGRAMMING DART
// ========================================

void main() {
  print('=== CONTOH OOP DART ===\n');

  // 1. CLASS DAN OBJECT
  contohClassObject();

  // 2. CONSTRUCTOR
  contohConstructor();

  // 3. ENCAPSULATION
  contohEncapsulation();

  // 4. INHERITANCE
  contohInheritance();

  // 5. POLYMORPHISM
  contohPolymorphism();

  // 6. ABSTRACTION
  contohAbstraction();

  // 7. INTERFACE
  contohInterface();

  // 8. MIXIN
  contohMixin();

  // 9. EXTENSION METHODS
  contohExtension();

  // 10. REAL WORLD EXAMPLE
  contohRealWorld();
}

// ========================================
// 1. CLASS DAN OBJECT
// ========================================
class Mobil {
  String merk;
  String model;
  int tahun;
  String warna;

  Mobil(this.merk, this.model, this.tahun, this.warna);

  void info() {
    print('$merk $model ($tahun) - $warna');
  }

  void klakson() {
    print('Beep! Beep!');
  }
}

void contohClassObject() {
  print('\n--- 1. CLASS DAN OBJECT ---');

  var mobil1 = Mobil('Toyota', 'Avanza', 2023, 'Silver');
  var mobil2 = Mobil('Honda', 'Civic', 2022, 'Merah');

  print('Mobil 1:');
  mobil1.info();
  mobil1.klakson();

  print('\nMobil 2:');
  mobil2.info();
  mobil2.klakson();
}

// ========================================
// 2. CONSTRUCTOR
// ========================================
class Point {
  double x;
  double y;

  // Default constructor
  Point(this.x, this.y);

  // Named constructor
  Point.origin() : x = 0, y = 0;

  Point.fromMap(Map<String, double> map) : x = map['x'] ?? 0, y = map['y'] ?? 0;

  // Named constructor (coordinate system)
  Point.polar(double r, double theta)
    : x = r * 1.0, // cos(theta) simplified for example
      y = r * 0.5; // sin(theta) simplified for example

  void display() {
    print('Point($x, $y)');
  }

  double distanceFromOrigin() {
    return (x * x + y * y);
  }
}

class User {
  String name;
  int age;
  String? email;
  String? phone;

  // Named parameters
  User({required this.name, required this.age, this.email, this.phone});

  void displayInfo() {
    print('Name: $name');
    print('Age: $age');
    if (email != null) print('Email: $email');
    if (phone != null) print('Phone: $phone');
  }
}

void contohConstructor() {
  print('\n--- 2. CONSTRUCTOR ---');

  var p1 = Point(3, 4);
  var p2 = Point.origin();
  var p3 = Point.fromMap({'x': 5, 'y': 12});

  print('Point 1:');
  p1.display();

  print('\nPoint 2 (origin):');
  p2.display();

  print('\nPoint 3 (from map):');
  p3.display();

  print('\nUser dengan named parameters:');
  var user = User(name: 'Alice', age: 25, email: 'alice@email.com');
  user.displayInfo();
}

// ========================================
// 3. ENCAPSULATION
// ========================================
class BankAccount {
  String _accountNumber; // Private
  String _ownerName;
  double _balance;

  BankAccount(this._accountNumber, this._ownerName, this._balance);

  // Getters
  String get accountNumber => _accountNumber;
  String get ownerName => _ownerName;
  double get balance => _balance;

  // Setter dengan validasi
  set ownerName(String name) {
    if (name.isNotEmpty) {
      _ownerName = name;
    }
  }

  // Public methods
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      _logTransaction('DEPOSIT', amount);
      print('Deposit berhasil. Saldo: $_balance');
    } else {
      print('Jumlah deposit harus > 0');
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      _logTransaction('WITHDRAW', amount);
      print('Penarikan berhasil. Saldo: $_balance');
    } else {
      print('Saldo tidak cukup atau jumlah invalid');
    }
  }

  // Private method
  void _logTransaction(String type, double amount) {
    print('[$type] Rp $amount - ${DateTime.now()}');
  }

  void displayInfo() {
    print('\n=== INFORMASI AKUN ===');
    print('No. Rekening: $_accountNumber');
    print('Pemilik: $_ownerName');
    print('Saldo: Rp $_balance');
  }
}

void contohEncapsulation() {
  print('\n--- 3. ENCAPSULATION ---');

  var account = BankAccount('1234567890', 'John Doe', 1000000);
  account.displayInfo();

  print('\nTransaksi:');
  account.deposit(500000);
  account.withdraw(200000);
  account.withdraw(2000000); // Gagal

  print('\nSaldo akhir: Rp ${account.balance}');
}

// ========================================
// 4. INHERITANCE
// ========================================
class Animal {
  String name;
  int age;

  Animal(this.name, this.age);

  void eat() {
    print('$name sedang makan');
  }

  void sleep() {
    print('$name sedang tidur');
  }

  void makeSound() {
    print('$name membuat suara');
  }
}

class Dog extends Animal {
  String breed;

  Dog(String name, int age, this.breed) : super(name, age);

  @override
  void makeSound() {
    print('$name menggonggong: Woof! Woof!');
  }

  void fetch() {
    print('$name mengambil bola');
  }
}

class Cat extends Animal {
  String color;

  Cat(String name, int age, this.color) : super(name, age);

  @override
  void makeSound() {
    print('$name mengeong: Meow!');
  }

  void scratch() {
    print('$name mencakar');
  }
}

void contohInheritance() {
  print('\n--- 4. INHERITANCE ---');

  var dog = Dog('Buddy', 3, 'Golden Retriever');
  print('Dog:');
  print('Nama: ${dog.name}, Umur: ${dog.age}, Ras: ${dog.breed}');
  dog.eat();
  dog.makeSound();
  dog.fetch();

  var cat = Cat('Whiskers', 2, 'Orange');
  print('\nCat:');
  print('Nama: ${cat.name}, Umur: ${cat.age}, Warna: ${cat.color}');
  cat.eat();
  cat.makeSound();
  cat.scratch();
}

// ========================================
// 5. POLYMORPHISM
// ========================================
abstract class Shape {
  String name;

  Shape(this.name);

  double area();
  double perimeter();

  void draw() {
    print('Menggambar $name');
  }

  void displayInfo() {
    print('\n=== $name ===');
    print('Luas: ${area().toStringAsFixed(2)}');
    print('Keliling: ${perimeter().toStringAsFixed(2)}');
  }
}

class Circle extends Shape {
  double radius;

  Circle(this.radius) : super('Lingkaran');

  @override
  double area() => 3.14159 * radius * radius;

  @override
  double perimeter() => 2 * 3.14159 * radius;
}

class Rectangle extends Shape {
  double width;
  double height;

  Rectangle(this.width, this.height) : super('Persegi Panjang');

  @override
  double area() => width * height;

  @override
  double perimeter() => 2 * (width + height);
}

class Triangle extends Shape {
  double base;
  double height;
  double side1;
  double side2;

  Triangle(this.base, this.height, this.side1, this.side2) : super('Segitiga');

  @override
  double area() => 0.5 * base * height;

  @override
  double perimeter() => base + side1 + side2;
}

void contohPolymorphism() {
  print('\n--- 5. POLYMORPHISM ---');

  List<Shape> shapes = [Circle(7), Rectangle(5, 10), Triangle(6, 8, 5, 5)];

  for (var shape in shapes) {
    shape.draw();
    shape.displayInfo();
  }

  // Calculate total area
  double totalArea = shapes.map((s) => s.area()).reduce((a, b) => a + b);
  print('\nTotal luas semua bentuk: ${totalArea.toStringAsFixed(2)}');
}

// ========================================
// 6. ABSTRACTION
// ========================================
abstract class Vehicle {
  String name;
  String brand;

  Vehicle(this.name, this.brand);

  // Abstract methods
  void start();
  void stop();
  void accelerate();

  // Concrete method
  void displayInfo() {
    print('$brand $name');
  }
}

class Car extends Vehicle {
  int numberOfDoors;

  Car(String name, String brand, this.numberOfDoors) : super(name, brand);

  @override
  void start() {
    print('$name: Memutar kunci, mesin menyala');
  }

  @override
  void stop() {
    print('$name: Menekan rem, mesin mati');
  }

  @override
  void accelerate() {
    print('$name: Menginjak pedal gas, kecepatan bertambah');
  }
}

class Motorcycle extends Vehicle {
  bool hasGear;

  Motorcycle(String name, String brand, this.hasGear) : super(name, brand);

  @override
  void start() {
    print('$name: Kick starter, mesin menyala');
  }

  @override
  void stop() {
    print('$name: Menekan rem, mesin mati');
  }

  @override
  void accelerate() {
    print('$name: Memutar throttle, kecepatan bertambah');
  }
}

void contohAbstraction() {
  print('\n--- 6. ABSTRACTION ---');

  List<Vehicle> vehicles = [
    Car('Avanza', 'Toyota', 4),
    Motorcycle('Supra X', 'Honda', true),
  ];

  for (var vehicle in vehicles) {
    print('\n---');
    vehicle.displayInfo();
    vehicle.start();
    vehicle.accelerate();
    vehicle.stop();
  }
}

// ========================================
// 7. INTERFACE
// ========================================
class Flyable {
  void fly() {
    print('Terbang');
  }
}

class Swimmable {
  void swim() {
    print('Berenang');
  }
}

class Walkable {
  void walk() {
    print('Berjalan');
  }
}

class Duck implements Flyable, Swimmable, Walkable {
  String name;

  Duck(this.name);

  @override
  void fly() {
    print('$name terbang rendah di atas air');
  }

  @override
  void swim() {
    print('$name berenang di kolam');
  }

  @override
  void walk() {
    print('$name berjalan dengan kaki berselaput');
  }
}

class Penguin implements Swimmable, Walkable {
  String name;

  Penguin(this.name);

  @override
  void swim() {
    print('$name berenang dengan cepat');
  }

  @override
  void walk() {
    print('$name berjalan dengan lucu');
  }
}

void contohInterface() {
  print('\n--- 7. INTERFACE ---');

  var duck = Duck('Donald');
  print('Bebek:');
  duck.fly();
  duck.swim();
  duck.walk();

  var penguin = Penguin('Pingu');
  print('\nPenguin:');
  penguin.swim();
  penguin.walk();
}

// ========================================
// 8. MIXIN
// ========================================
mixin Electric {
  int batteryLevel = 100;

  void charge() {
    batteryLevel = 100;
    print('Baterai terisi penuh: $batteryLevel%');
  }

  void useBattery(int amount) {
    batteryLevel -= amount;
    print('Baterai tersisa: $batteryLevel%');
  }
}

mixin GPS {
  String currentLocation = 'Unknown';

  void updateLocation(String location) {
    currentLocation = location;
    print('Lokasi saat ini: $location');
  }

  void navigate(String destination) {
    print('Navigasi ke $destination dari $currentLocation');
  }
}

class Smartphone with Electric, GPS {
  String brand;
  String model;

  Smartphone(this.brand, this.model);

  void call(String number) {
    useBattery(5);
    print('Menelepon $number...');
  }

  void displayInfo() {
    print('\n$brand $model');
    print('Baterai: $batteryLevel%');
    print('Lokasi: $currentLocation');
  }
}

class ElectricCar with Electric, GPS {
  String model;

  ElectricCar(this.model);

  void drive(String destination) {
    navigate(destination);
    useBattery(20);
    print('$model sedang melaju...');
  }
}

void contohMixin() {
  print('\n--- 8. MIXIN ---');

  var phone = Smartphone('Apple', 'iPhone 15');
  phone.displayInfo();
  phone.updateLocation('Jakarta');
  phone.call('08123456789');
  phone.navigate('Bandung');

  print('\n---');
  var car = ElectricCar('Tesla Model 3');
  car.charge();
  car.updateLocation('Jakarta');
  car.drive('Surabaya');
}

// ========================================
// 9. EXTENSION METHODS
// ========================================
extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  String get reversed => split('').reversed.join('');

  bool get isPalindrome {
    String cleaned = toLowerCase().replaceAll(' ', '');
    return cleaned == cleaned.split('').reversed.join('');
  }

  int get wordCount => trim().split(RegExp(r'\s+')).length;
}

extension IntExtension on int {
  bool get isEven => this % 2 == 0;
  bool get isOdd => this % 2 != 0;
  bool get isPrime {
    if (this < 2) return false;
    for (int i = 2; i <= this ~/ 2; i++) {
      if (this % i == 0) return false;
    }
    return true;
  }

  String get toRoman {
    if (this <= 0 || this > 3999) return 'Invalid';

    List<int> values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
    List<String> numerals = [
      'M',
      'CM',
      'D',
      'CD',
      'C',
      'XC',
      'L',
      'XL',
      'X',
      'IX',
      'V',
      'IV',
      'I',
    ];

    String result = '';
    int num = this;

    for (int i = 0; i < values.length; i++) {
      while (num >= values[i]) {
        result += numerals[i];
        num -= values[i];
      }
    }

    return result;
  }
}

void contohExtension() {
  print('\n--- 9. EXTENSION METHODS ---');

  // String extensions
  print('hello'.capitalize()); // Hello
  print('Dart'.reversed); // traD
  print('radar'.isPalindrome); // true
  print('Hello World Dart'.wordCount); // 3

  // Int extensions
  print('\n4 is even: ${4.isEven}');
  print('7 is odd: ${7.isOdd}');
  print('17 is prime: ${17.isPrime}');
  print('2024 in Roman: ${2024.toRoman}');
}

// ========================================
// 10. REAL WORLD EXAMPLE: E-COMMERCE
// ========================================
abstract class Product {
  String id;
  String name;
  double price;

  Product(this.id, this.name, this.price);

  void displayInfo();
}

class Book extends Product {
  String author;
  String isbn;

  Book(String id, String name, double price, this.author, this.isbn)
    : super(id, name, price);

  @override
  void displayInfo() {
    print('Book: $name by $author (ISBN: $isbn) - Rp $price');
  }
}

class Electronics extends Product {
  String brand;
  int warranty; // dalam bulan

  Electronics(String id, String name, double price, this.brand, this.warranty)
    : super(id, name, price);

  @override
  void displayInfo() {
    print('Electronics: $brand $name - Rp $price (Garansi: $warranty bulan)');
  }
}

class ShoppingCart {
  List<Product> _items = [];

  void addItem(Product product) {
    _items.add(product);
    print('✓ ${product.name} ditambahkan ke keranjang');
  }

  void removeItem(String productId) {
    _items.removeWhere((item) => item.id == productId);
    print('✓ Produk dihapus dari keranjang');
  }

  double getTotalPrice() {
    return _items.fold(0, (sum, item) => sum + item.price);
  }

  void displayCart() {
    print('\n=== KERANJANG BELANJA ===');
    if (_items.isEmpty) {
      print('Keranjang kosong');
      return;
    }

    for (var item in _items) {
      item.displayInfo();
    }
    print('---');
    print('Total: Rp ${getTotalPrice()}');
  }

  void checkout() {
    print('\n=== CHECKOUT ===');
    displayCart();
    print('\nPembayaran berhasil!');
    _items.clear();
  }
}

void contohRealWorld() {
  print('\n--- 10. REAL WORLD EXAMPLE: E-COMMERCE ---');

  var cart = ShoppingCart();

  var book1 = Book(
    'B001',
    'Clean Code',
    250000,
    'Robert C. Martin',
    '978-0132350884',
  );
  var book2 = Book(
    'B002',
    'Design Patterns',
    300000,
    'Gang of Four',
    '978-0201633610',
  );
  var laptop = Electronics('E001', 'ThinkPad X1', 15000000, 'Lenovo', 36);
  var phone = Electronics('E002', 'iPhone 15', 12000000, 'Apple', 12);

  cart.addItem(book1);
  cart.addItem(laptop);
  cart.addItem(book2);

  cart.displayCart();

  cart.removeItem('B002');
  cart.displayCart();

  cart.addItem(phone);
  cart.checkout();

  cart.displayCart();
}
