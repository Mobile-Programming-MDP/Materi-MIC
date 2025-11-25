# Struktur Dasar Dart

## Daftar Isi
1. [Pengenalan Dart](#pengenalan-dart)
2. [Variabel dan Tipe Data](#variabel-dan-tipe-data)
3. [Operator](#operator)
4. [Control Flow](#control-flow)
5. [Function](#function)
6. [Collections](#collections)
7. [Null Safety](#null-safety)

---

## Pengenalan Dart

Dart adalah bahasa pemrograman yang dikembangkan oleh Google, dirancang untuk membangun aplikasi multi-platform (mobile, web, desktop). Dart adalah bahasa yang strongly-typed dengan fitur modern seperti null safety.

### Struktur Program Dart

Setiap program Dart dimulai dengan fungsi `main()`:

```dart
void main() {
  print('Hello, Dart!');
}
```

---

## Variabel dan Tipe Data

### Deklarasi Variabel

Ada beberapa cara mendeklarasikan variabel di Dart:

1. **var** - Tipe data ditentukan otomatis
2. **dynamic** - Tipe data dapat berubah
3. **final** - Nilai hanya dapat diset sekali (runtime constant)
4. **const** - Nilai konstan pada compile time

```dart
var name = 'John';           // String (inferred)
dynamic age = 25;            // dapat berubah tipe
final city = 'Jakarta';      // tidak dapat diubah setelah diset
const pi = 3.14159;          // compile-time constant
```

### Tipe Data Dasar

1. **Numbers**: `int`, `double`
2. **Strings**: `String`
3. **Booleans**: `bool`
4. **Lists**: `List` (array)
5. **Sets**: `Set` (koleksi unik)
6. **Maps**: `Map` (key-value pairs)

```dart
// Numbers
int score = 100;
double price = 99.99;

// String
String greeting = 'Hello';
String multiline = '''
  Ini adalah
  string multiline
''';

// Boolean
bool isActive = true;

// String interpolation
String message = 'Score: $score, Price: ${price * 2}';
```

---

## Operator

### Operator Aritmatika
- `+` (tambah), `-` (kurang), `*` (kali), `/` (bagi), `~/` (bagi bulat), `%` (modulo)

### Operator Perbandingan
- `==` (sama dengan), `!=` (tidak sama dengan)
- `>`, `<`, `>=`, `<=`

### Operator Logika
- `&&` (AND), `||` (OR), `!` (NOT)

### Operator Assignment
- `=`, `+=`, `-=`, `*=`, `/=`

### Operator Ternary
```dart
String status = age >= 18 ? 'Dewasa' : 'Anak-anak';
```

### Null-aware Operators
- `??` (null coalescing): memberikan nilai default jika null
- `?.` (null-aware access): akses property jika tidak null
- `??=` (null-aware assignment): assign jika null

```dart
String? name;
String displayName = name ?? 'Guest';  // 'Guest'
int? length = name?.length;             // null
name ??= 'Default';                     // set jika null
```

---

## Control Flow

### If-Else Statement

```dart
if (score >= 80) {
  print('A');
} else if (score >= 70) {
  print('B');
} else {
  print('C');
}
```

### Switch Statement

```dart
switch (grade) {
  case 'A':
    print('Excellent!');
    break;
  case 'B':
    print('Good!');
    break;
  default:
    print('Keep trying!');
}
```

### Loops

**For Loop:**
```dart
for (int i = 0; i < 5; i++) {
  print(i);
}

// For-in loop
List<String> fruits = ['Apple', 'Banana', 'Orange'];
for (var fruit in fruits) {
  print(fruit);
}
```

**While Loop:**
```dart
int count = 0;
while (count < 5) {
  print(count);
  count++;
}
```

**Do-While Loop:**
```dart
int num = 0;
do {
  print(num);
  num++;
} while (num < 5);
```

---

## Function

### Deklarasi Function

```dart
// Function dengan return type
int tambah(int a, int b) {
  return a + b;
}

// Arrow function (untuk single expression)
int kali(int a, int b) => a * b;

// Function tanpa return (void)
void greet(String name) {
  print('Hello, $name!');
}
```

### Optional Parameters

**Named Parameters:**
```dart
void printInfo({String? name, int? age}) {
  print('Name: $name, Age: $age');
}

// Pemanggilan
printInfo(name: 'John', age: 25);
printInfo(name: 'Jane');  // age akan null
```

**Named Parameters dengan Default Value:**
```dart
void printInfo2({String name = 'Guest', int age = 0}) {
  print('Name: $name, Age: $age');
}
```

**Required Named Parameters:**
```dart
void printInfo3({required String name, required int age}) {
  print('Name: $name, Age: $age');
}
```

**Positional Optional Parameters:**
```dart
String greet2(String name, [String? title]) {
  if (title != null) {
    return 'Hello, $title $name';
  }
  return 'Hello, $name';
}
```

### Anonymous Function (Lambda)

```dart
var list = [1, 2, 3, 4, 5];

// Anonymous function
list.forEach((item) {
  print(item);
});

// Arrow function
var doubled = list.map((item) => item * 2).toList();
```

---

## Collections

### List

```dart
// List declaration
List<int> numbers = [1, 2, 3, 4, 5];
var fruits = ['Apple', 'Banana', 'Orange'];

// Add element
fruits.add('Mango');
fruits.addAll(['Grape', 'Melon']);

// Access element
print(fruits[0]);  // 'Apple'

// Common operations
print(fruits.length);
fruits.remove('Banana');
fruits.removeAt(0);
fruits.clear();

// Spread operator
var moreFruits = ['Papaya', ...fruits];

// Collection if
var promoActive = true;
var nav = [
  'Home',
  'Shop',
  if (promoActive) 'Promo'
];

// Collection for
var listOfInts = [1, 2, 3];
var listOfStrings = [
  '#0',
  for (var i in listOfInts) '#$i'
];
```

### Set

```dart
// Set (no duplicates)
Set<String> uniqueNames = {'Alice', 'Bob', 'Charlie'};
uniqueNames.add('Alice');  // tidak akan ditambahkan (sudah ada)

print(uniqueNames.length);  // 3
print(uniqueNames.contains('Bob'));  // true
```

### Map

```dart
// Map declaration
Map<String, int> scores = {
  'Alice': 90,
  'Bob': 85,
  'Charlie': 95
};

// Add/Update
scores['David'] = 88;
scores['Alice'] = 92;  // update

// Access
print(scores['Bob']);  // 85

// Check key
if (scores.containsKey('Alice')) {
  print('Alice score: ${scores['Alice']}');
}

// Iterate
scores.forEach((name, score) {
  print('$name: $score');
});

// Keys and values
print(scores.keys);    // (Alice, Bob, Charlie, David)
print(scores.values);  // (92, 85, 95, 88)
```

---

## Null Safety

Dart mendukung sound null safety. Variabel tidak dapat berisi `null` kecuali dideklarasikan secara eksplisit.

### Nullable vs Non-nullable

```dart
// Non-nullable (tidak bisa null)
String name = 'John';
// name = null;  // ERROR!

// Nullable (bisa null)
String? nullableName;
nullableName = 'Jane';
nullableName = null;  // OK
```

### Null-aware Operators

```dart
String? name;

// Null coalescing
String displayName = name ?? 'Guest';

// Null-aware access
int? length = name?.length;

// Null assertion (! operator) - gunakan dengan hati-hati
// String upperName = name!.toUpperCase();  // throw error jika name null

// Null-aware assignment
name ??= 'Default Name';
```

### Late Variables

`late` digunakan untuk variabel yang akan diinisialisasi nanti tetapi pasti sebelum digunakan:

```dart
late String description;

void initialize() {
  description = 'This is initialized later';
}

void main() {
  initialize();
  print(description);  // OK
}
```

---

## Best Practices

1. **Gunakan `const` dan `final`** untuk nilai yang tidak berubah
2. **Gunakan null safety** dengan benar - hindari `!` operator kecuali yakin
3. **Gunakan type inference** (`var`) untuk kode yang lebih bersih
4. **Gunakan collection literals** (`[]`, `{}`) daripada constructor
5. **Gunakan string interpolation** (`$variable`) daripada concatenation
6. **Gunakan arrow functions** untuk fungsi sederhana
7. **Gunakan named parameters** untuk fungsi dengan banyak parameter

---

## Lihat Juga

- [Contoh Script](./contoh.dart) - Berbagai contoh kode untuk setiap konsep
- [Latihan Soal](./latihan.md) - Soal latihan untuk praktik
- [Jawaban Latihan](./jawaban.dart) - Script jawaban untuk latihan soal
