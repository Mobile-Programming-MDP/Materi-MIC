# Latihan Soal - Struktur Dasar Dart

## Petunjuk
Kerjakan soal-soal berikut dengan membuat script Dart. Setiap soal harus dibuat dalam fungsi terpisah. Jawaban tersedia di file `jawaban.dart`.

---

## Soal 1: Variabel dan Tipe Data (10 poin)

Buatlah program yang mendeklarasikan variabel-variabel berikut dan tampilkan informasinya:
- Nama lengkap (String)
- Umur (int)
- Tinggi badan dalam meter (double)
- Status mahasiswa (bool)
- Hobi (List<String>)

Format output:
```
=== PROFIL SAYA ===
Nama: [nama]
Umur: [umur] tahun
Tinggi: [tinggi] meter
Mahasiswa: [true/false]
Hobi: [hobi1, hobi2, ...]
```

---

## Soal 2: Kalkulator Sederhana (15 poin)

Buatlah fungsi `kalkulator` yang menerima parameter:
- `angka1` (double)
- `operator` (String: '+', '-', '*', '/')
- `angka2` (double)

Fungsi harus mengembalikan hasil kalkulasi. Gunakan switch statement untuk menentukan operasi.

Contoh:
```dart
kalkulator(10, '+', 5)  // Output: 15.0
kalkulator(10, '/', 3)  // Output: 3.333...
```

---

## Soal 3: Pengecekan Bilangan (15 poin)

Buatlah fungsi `cekBilangan` yang menerima parameter `angka` (int) dan mencetak:
- "Positif" jika angka > 0
- "Negatif" jika angka < 0
- "Nol" jika angka = 0
- "Genap" atau "Ganjil"
- "Prima" atau "Bukan Prima"

Contoh output untuk angka 7:
```
Angka: 7
Jenis: Positif
Paritas: Ganjil
Prima: Prima
```

---

## Soal 4: Konversi Nilai (15 poin)

Buatlah fungsi `konversiNilai` yang menerima nilai angka (0-100) dan mengembalikan grade:
- A: 85-100
- B: 70-84
- C: 60-69
- D: 50-59
- E: 0-49

Tambahkan juga predikat:
- A: "Sangat Baik"
- B: "Baik"
- C: "Cukup"
- D: "Kurang"
- E: "Sangat Kurang"

---

## Soal 5: Manipulasi List (20 poin)

Buatlah program yang:
1. Membuat list angka dari 1-10
2. Menampilkan semua bilangan genap
3. Menampilkan semua bilangan ganjil
4. Menghitung total semua bilangan
5. Menghitung rata-rata
6. Menemukan nilai tertinggi dan terendah

---

## Soal 6: Deret Fibonacci (20 poin)

Buatlah fungsi `fibonacci` yang menerima parameter `n` (int) dan mengembalikan List berisi n angka pertama dari deret Fibonacci.

Deret Fibonacci: 0, 1, 1, 2, 3, 5, 8, 13, 21, ...

Contoh:
```dart
fibonacci(7)  // Output: [0, 1, 1, 2, 3, 5, 8]
```

---

## Soal 7: Map Data Mahasiswa (20 poin)

Buatlah program untuk mengelola data mahasiswa menggunakan Map:
1. Buat Map dengan key = NIM (String) dan value = Map berisi {nama, jurusan, ipk}
2. Tambahkan minimal 5 mahasiswa
3. Tampilkan semua mahasiswa
4. Cari mahasiswa dengan IPK tertinggi
5. Tampilkan mahasiswa dari jurusan tertentu
6. Hitung rata-rata IPK semua mahasiswa

---

## Soal 8: Palindrome Checker (15 poin)

Buatlah fungsi `isPalindrome` yang menerima String dan mengembalikan true jika string tersebut adalah palindrome (dibaca sama dari depan dan belakang).

Contoh:
```dart
isPalindrome("katak")     // true
isPalindrome("radar")     // true
isPalindrome("hello")     // false
isPalindrome("Kasur rusak")  // true (ignore case & space)
```

---

## Soal 9: FizzBuzz (15 poin)

Buatlah program FizzBuzz untuk angka 1-100:
- Jika angka habis dibagi 3 dan 5: print "FizzBuzz"
- Jika angka habis dibagi 3: print "Fizz"
- Jika angka habis dibagi 5: print "Buzz"
- Selain itu: print angkanya

---

## Soal 10: Validasi Password (20 poin)

Buatlah fungsi `validatePassword` yang menerima String password dan mengembalikan Map<String, dynamic> dengan struktur:
```dart
{
  'valid': bool,
  'messages': List<String>
}
```

Kriteria password valid:
- Minimal 8 karakter
- Mengandung minimal 1 huruf besar
- Mengandung minimal 1 huruf kecil
- Mengandung minimal 1 angka
- Mengandung minimal 1 karakter spesial (!@#$%^&*)

---

## Soal 11: Statistik List (20 poin)

Buatlah fungsi `hitungStatistik` yang menerima List<int> dan mengembalikan Map berisi:
- count: jumlah elemen
- sum: total semua elemen
- mean: rata-rata
- median: nilai tengah
- mode: nilai yang paling sering muncul
- min: nilai terkecil
- max: nilai terbesar

---

## Soal 12: Konversi Waktu (15 poin)

Buatlah fungsi `konversiDetik` yang menerima jumlah detik (int) dan mengembalikan String dalam format:
```
X hari Y jam Z menit W detik
```

Contoh:
```dart
konversiDetik(90061)  // "1 hari 1 jam 1 menit 1 detik"
konversiDetik(3665)   // "0 hari 1 jam 1 menit 5 detik"
```

---

## Soal Bonus: Pattern Printing (15 poin)

Buatlah fungsi yang mencetak pattern segitiga angka:

```
1
1 2
1 2 3
1 2 3 4
1 2 3 4 5
```

Dan pattern piramida bintang:
```
    *
   ***
  *****
 *******
*********
```

---

## Penilaian

Total poin: 215 (termasuk bonus 15)

**Grade:**
- A: 180-215
- B: 150-179
- C: 120-149
- D: 90-119
- E: < 90

**Catatan:**
- Kode harus bersih dan mudah dibaca
- Gunakan nama variabel yang deskriptif
- Tambahkan komentar jika diperlukan
- Tangani edge cases dengan baik
