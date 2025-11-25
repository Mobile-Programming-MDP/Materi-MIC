// ========================================
// JAWABAN LATIHAN STRUKTUR DASAR DART
// ========================================

void main() {
  print('=== JAWABAN LATIHAN STRUKTUR DASAR DART ===\n');

  // Soal 1
  print('SOAL 1: Variabel dan Tipe Data');
  soal1();

  // Soal 2
  print('\n${'=' * 50}');
  print('SOAL 2: Kalkulator Sederhana');
  soal2();

  // Soal 3
  print('\n${'=' * 50}');
  print('SOAL 3: Pengecekan Bilangan');
  soal3();

  // Soal 4
  print('\n${'=' * 50}');
  print('SOAL 4: Konversi Nilai');
  soal4();

  // Soal 5
  print('\n${'=' * 50}');
  print('SOAL 5: Manipulasi List');
  soal5();

  // Soal 6
  print('\n${'=' * 50}');
  print('SOAL 6: Deret Fibonacci');
  soal6();

  // Soal 7
  print('\n${'=' * 50}');
  print('SOAL 7: Map Data Mahasiswa');
  soal7();

  // Soal 8
  print('\n${'=' * 50}');
  print('SOAL 8: Palindrome Checker');
  soal8();

  // Soal 9
  print('\n${'=' * 50}');
  print('SOAL 9: FizzBuzz');
  soal9();

  // Soal 10
  print('\n${'=' * 50}');
  print('SOAL 10: Validasi Password');
  soal10();

  // Soal 11
  print('\n${'=' * 50}');
  print('SOAL 11: Statistik List');
  soal11();

  // Soal 12
  print('\n${'=' * 50}');
  print('SOAL 12: Konversi Waktu');
  soal12();

  // Soal Bonus
  print('\n${'=' * 50}');
  print('SOAL BONUS: Pattern Printing');
  soalBonus();
}

// ========================================
// SOAL 1: Variabel dan Tipe Data
// ========================================
void soal1() {
  String namaLengkap = 'Budi Santoso';
  int umur = 21;
  double tinggiBadan = 1.75;
  bool statusMahasiswa = true;
  List<String> hobi = ['Membaca', 'Coding', 'Gaming', 'Traveling'];

  print('=== PROFIL SAYA ===');
  print('Nama: $namaLengkap');
  print('Umur: $umur tahun');
  print('Tinggi: $tinggiBadan meter');
  print('Mahasiswa: $statusMahasiswa');
  print('Hobi: ${hobi.join(', ')}');
}

// ========================================
// SOAL 2: Kalkulator Sederhana
// ========================================
double kalkulator(double angka1, String operator, double angka2) {
  switch (operator) {
    case '+':
      return angka1 + angka2;
    case '-':
      return angka1 - angka2;
    case '*':
      return angka1 * angka2;
    case '/':
      if (angka2 == 0) {
        print('Error: Tidak bisa membagi dengan 0');
        return 0;
      }
      return angka1 / angka2;
    default:
      print('Error: Operator tidak valid');
      return 0;
  }
}

void soal2() {
  print('10 + 5 = ${kalkulator(10, '+', 5)}');
  print('10 - 5 = ${kalkulator(10, '-', 5)}');
  print('10 * 5 = ${kalkulator(10, '*', 5)}');
  print('10 / 3 = ${kalkulator(10, '/', 3)}');
  print('10 / 0 = ${kalkulator(10, '/', 0)}');
}

// ========================================
// SOAL 3: Pengecekan Bilangan
// ========================================
void cekBilangan(int angka) {
  print('\nAngka: $angka');

  // Cek positif/negatif/nol
  String jenis;
  if (angka > 0) {
    jenis = 'Positif';
  } else if (angka < 0) {
    jenis = 'Negatif';
  } else {
    jenis = 'Nol';
  }
  print('Jenis: $jenis');

  // Cek genap/ganjil
  if (angka != 0) {
    String paritas = angka % 2 == 0 ? 'Genap' : 'Ganjil';
    print('Paritas: $paritas');
  }

  // Cek prima
  if (angka > 1) {
    bool isPrima = true;
    for (int i = 2; i <= angka ~/ 2; i++) {
      if (angka % i == 0) {
        isPrima = false;
        break;
      }
    }
    print('Prima: ${isPrima ? 'Prima' : 'Bukan Prima'}');
  }
}

void soal3() {
  cekBilangan(7);
  cekBilangan(-5);
  cekBilangan(0);
  cekBilangan(12);
  cekBilangan(17);
}

// ========================================
// SOAL 4: Konversi Nilai
// ========================================
Map<String, String> konversiNilai(int nilai) {
  String grade;
  String predikat;

  if (nilai >= 85) {
    grade = 'A';
    predikat = 'Sangat Baik';
  } else if (nilai >= 70) {
    grade = 'B';
    predikat = 'Baik';
  } else if (nilai >= 60) {
    grade = 'C';
    predikat = 'Cukup';
  } else if (nilai >= 50) {
    grade = 'D';
    predikat = 'Kurang';
  } else {
    grade = 'E';
    predikat = 'Sangat Kurang';
  }

  return {'grade': grade, 'predikat': predikat};
}

void soal4() {
  List<int> nilaiList = [95, 82, 67, 55, 45];

  for (var nilai in nilaiList) {
    var result = konversiNilai(nilai);
    print('Nilai: $nilai -> Grade: ${result['grade']} (${result['predikat']})');
  }
}

// ========================================
// SOAL 5: Manipulasi List
// ========================================
void soal5() {
  // 1. Membuat list 1-10
  List<int> numbers = List.generate(10, (index) => index + 1);
  print('List angka: $numbers');

  // 2. Bilangan genap
  List<int> genap = numbers.where((n) => n % 2 == 0).toList();
  print('Bilangan genap: $genap');

  // 3. Bilangan ganjil
  List<int> ganjil = numbers.where((n) => n % 2 != 0).toList();
  print('Bilangan ganjil: $ganjil');

  // 4. Total
  int total = numbers.reduce((a, b) => a + b);
  print('Total: $total');

  // 5. Rata-rata
  double rataRata = total / numbers.length;
  print('Rata-rata: $rataRata');

  // 6. Min dan Max
  int min = numbers.reduce((a, b) => a < b ? a : b);
  int max = numbers.reduce((a, b) => a > b ? a : b);
  print('Nilai terkecil: $min');
  print('Nilai terbesar: $max');
}

// ========================================
// SOAL 6: Deret Fibonacci
// ========================================
List<int> fibonacci(int n) {
  if (n <= 0) return [];
  if (n == 1) return [0];

  List<int> fib = [0, 1];

  for (int i = 2; i < n; i++) {
    fib.add(fib[i - 1] + fib[i - 2]);
  }

  return fib;
}

void soal6() {
  print('Fibonacci(7): ${fibonacci(7)}');
  print('Fibonacci(10): ${fibonacci(10)}');
  print('Fibonacci(15): ${fibonacci(15)}');
}

// ========================================
// SOAL 7: Map Data Mahasiswa
// ========================================
void soal7() {
  // 1 & 2. Buat Map mahasiswa
  Map<String, Map<String, dynamic>> mahasiswa = {
    'M001': {'nama': 'Alice', 'jurusan': 'Informatika', 'ipk': 3.8},
    'M002': {'nama': 'Bob', 'jurusan': 'Sistem Informasi', 'ipk': 3.5},
    'M003': {'nama': 'Charlie', 'jurusan': 'Informatika', 'ipk': 3.9},
    'M004': {'nama': 'Diana', 'jurusan': 'Teknik Komputer', 'ipk': 3.7},
    'M005': {'nama': 'Eve', 'jurusan': 'Informatika', 'ipk': 3.6},
  };

  // 3. Tampilkan semua mahasiswa
  print('=== DAFTAR MAHASISWA ===');
  mahasiswa.forEach((nim, data) {
    print('$nim - ${data['nama']} (${data['jurusan']}) - IPK: ${data['ipk']}');
  });

  // 4. IPK tertinggi
  var maxIpkEntry = mahasiswa.entries.reduce(
    (a, b) => a.value['ipk'] > b.value['ipk'] ? a : b,
  );
  print('\nMahasiswa dengan IPK tertinggi:');
  print(
    '${maxIpkEntry.key} - ${maxIpkEntry.value['nama']} - IPK: ${maxIpkEntry.value['ipk']}',
  );

  // 5. Mahasiswa dari jurusan tertentu
  String jurusanCari = 'Informatika';
  print('\nMahasiswa jurusan $jurusanCari:');
  mahasiswa.forEach((nim, data) {
    if (data['jurusan'] == jurusanCari) {
      print('$nim - ${data['nama']} - IPK: ${data['ipk']}');
    }
  });

  // 6. Rata-rata IPK
  double totalIpk = 0;
  mahasiswa.forEach((nim, data) {
    totalIpk += data['ipk'];
  });
  double rataRataIpk = totalIpk / mahasiswa.length;
  print('\nRata-rata IPK: ${rataRataIpk.toStringAsFixed(2)}');
}

// ========================================
// SOAL 8: Palindrome Checker
// ========================================
bool isPalindrome(String text) {
  // Remove spaces and convert to lowercase
  String cleaned = text.replaceAll(' ', '').toLowerCase();

  // Check if reversed string equals original
  String reversed = cleaned.split('').reversed.join('');

  return cleaned == reversed;
}

void soal8() {
  List<String> testCases = [
    'katak',
    'radar',
    'hello',
    'Kasur rusak',
    'A man a plan a canal Panama',
    'racecar',
    'world',
  ];

  for (var text in testCases) {
    print('isPalindrome("$text"): ${isPalindrome(text)}');
  }
}

// ========================================
// SOAL 9: FizzBuzz
// ========================================
void soal9() {
  for (int i = 1; i <= 100; i++) {
    if (i % 3 == 0 && i % 5 == 0) {
      print('$i: FizzBuzz');
    } else if (i % 3 == 0) {
      print('$i: Fizz');
    } else if (i % 5 == 0) {
      print('$i: Buzz');
    } else {
      print('$i: $i');
    }
  }
}

// ========================================
// SOAL 10: Validasi Password
// ========================================
Map<String, dynamic> validatePassword(String password) {
  List<String> messages = [];
  bool valid = true;

  // Cek panjang minimal
  if (password.length < 8) {
    messages.add('Password harus minimal 8 karakter');
    valid = false;
  }

  // Cek huruf besar
  if (!password.contains(RegExp(r'[A-Z]'))) {
    messages.add('Password harus mengandung minimal 1 huruf besar');
    valid = false;
  }

  // Cek huruf kecil
  if (!password.contains(RegExp(r'[a-z]'))) {
    messages.add('Password harus mengandung minimal 1 huruf kecil');
    valid = false;
  }

  // Cek angka
  if (!password.contains(RegExp(r'[0-9]'))) {
    messages.add('Password harus mengandung minimal 1 angka');
    valid = false;
  }

  // Cek karakter spesial
  if (!password.contains(RegExp(r'[!@#$%^&*]'))) {
    messages.add(
      'Password harus mengandung minimal 1 karakter spesial (!@#\$%^&*)',
    );
    valid = false;
  }

  if (valid) {
    messages.add('Password valid!');
  }

  return {'valid': valid, 'messages': messages};
}

void soal10() {
  List<String> passwords = [
    'weak',
    'StrongPass123!',
    'NoSpecial123',
    'noupppercase1!',
    'NOLOWERCASE1!',
    'NoNumber!@#',
    'Secure@Pass2024',
  ];

  for (var pwd in passwords) {
    print('\nPassword: "$pwd"');
    var result = validatePassword(pwd);
    print('Valid: ${result['valid']}');
    for (var message in result['messages']) {
      print('  - $message');
    }
  }
}

// ========================================
// SOAL 11: Statistik List
// ========================================
Map<String, dynamic> hitungStatistik(List<int> data) {
  if (data.isEmpty) {
    return {
      'count': 0,
      'sum': 0,
      'mean': 0,
      'median': 0,
      'mode': null,
      'min': null,
      'max': null,
    };
  }

  // Count dan Sum
  int count = data.length;
  int sum = data.reduce((a, b) => a + b);

  // Mean
  double mean = sum / count;

  // Median
  List<int> sorted = [...data]..sort();
  double median;
  int mid = count ~/ 2;
  if (count % 2 == 0) {
    median = (sorted[mid - 1] + sorted[mid]) / 2;
  } else {
    median = sorted[mid].toDouble();
  }

  // Mode (nilai yang paling sering muncul)
  Map<int, int> frequency = {};
  for (var num in data) {
    frequency[num] = (frequency[num] ?? 0) + 1;
  }
  int maxFreq = frequency.values.reduce((a, b) => a > b ? a : b);
  List<int> modes = frequency.entries
      .where((e) => e.value == maxFreq)
      .map((e) => e.key)
      .toList();
  var mode = modes.length == data.length ? null : modes;

  // Min dan Max
  int min = data.reduce((a, b) => a < b ? a : b);
  int max = data.reduce((a, b) => a > b ? a : b);

  return {
    'count': count,
    'sum': sum,
    'mean': mean,
    'median': median,
    'mode': mode,
    'min': min,
    'max': max,
  };
}

void soal11() {
  List<int> data = [5, 2, 8, 2, 9, 1, 5, 5, 7, 3];
  print('Data: $data');

  var stats = hitungStatistik(data);
  print('\nStatistik:');
  print('Count: ${stats['count']}');
  print('Sum: ${stats['sum']}');
  print('Mean: ${stats['mean'].toStringAsFixed(2)}');
  print('Median: ${stats['median']}');
  print('Mode: ${stats['mode']}');
  print('Min: ${stats['min']}');
  print('Max: ${stats['max']}');
}

// ========================================
// SOAL 12: Konversi Waktu
// ========================================
String konversiDetik(int totalDetik) {
  int hari = totalDetik ~/ 86400;
  int sisaDetik = totalDetik % 86400;

  int jam = sisaDetik ~/ 3600;
  sisaDetik = sisaDetik % 3600;

  int menit = sisaDetik ~/ 60;
  int detik = sisaDetik % 60;

  return '$hari hari $jam jam $menit menit $detik detik';
}

void soal12() {
  print('90061 detik = ${konversiDetik(90061)}');
  print('3665 detik = ${konversiDetik(3665)}');
  print('86400 detik = ${konversiDetik(86400)}');
  print('123456 detik = ${konversiDetik(123456)}');
}

// ========================================
// SOAL BONUS: Pattern Printing
// ========================================
void soalBonus() {
  // Pattern 1: Segitiga angka
  print('\nPattern 1 - Segitiga Angka:');
  for (int i = 1; i <= 5; i++) {
    String line = '';
    for (int j = 1; j <= i; j++) {
      line += '$j ';
    }
    print(line.trim());
  }

  // Pattern 2: Piramida bintang
  print('\nPattern 2 - Piramida Bintang:');
  int tinggi = 5;
  for (int i = 1; i <= tinggi; i++) {
    // Spasi
    String spasi = ' ' * (tinggi - i);
    // Bintang
    String bintang = '*' * (2 * i - 1);
    print('$spasi$bintang');
  }

  // Pattern bonus: Segitiga terbalik
  print('\nPattern Bonus - Segitiga Terbalik:');
  for (int i = 5; i >= 1; i--) {
    String line = '';
    for (int j = 1; j <= i; j++) {
      line += '* ';
    }
    print(line.trim());
  }
}
