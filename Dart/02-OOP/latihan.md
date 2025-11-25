# Latihan Soal - Object-Oriented Programming Dart

## Petunjuk
Kerjakan soal-soal berikut dengan menerapkan konsep OOP. Setiap soal harus mendemonstrasikan prinsip OOP yang sesuai. Jawaban tersedia di file `jawaban.dart`.

---

## Soal 1: Class dan Object - Buku Perpustakaan (15 poin)

Buatlah class `Book` dengan properties:
- `title` (String)
- `author` (String)
- `isbn` (String)
- `year` (int)
- `isAvailable` (bool)

Methods:
- `displayInfo()` - menampilkan informasi buku
- `borrow()` - meminjam buku (ubah isAvailable menjadi false)
- `returnBook()` - mengembalikan buku (ubah isAvailable menjadi true)

Buat minimal 3 objek buku dan simulasikan peminjaman dan pengembalian.

---

## Soal 2: Constructor - Mahasiswa (15 poin)

Buatlah class `Mahasiswa` dengan:
- Default constructor dengan parameter: `nama`, `nim`, `jurusan`
- Named constructor `Mahasiswa.baru()` yang hanya menerima `nama` dan `nim`, dengan `jurusan` default "Belum Ditentukan"
- Named constructor `Mahasiswa.fromMap()` yang membuat objek dari Map

Properties tambahan:
- `ipk` (double, default 0.0)

Methods:
- `updateIpk(double newIpk)` - update IPK
- `displayInfo()` - tampilkan informasi mahasiswa

---

## Soal 3: Encapsulation - Rekening Bank (20 poin)

Buatlah class `RekeningBank` dengan:

Private properties:
- `_nomorRekening` (String)
- `_namaPemilik` (String)
- `_saldo` (double)
- `_pin` (String)

Public methods:
- `deposit(double jumlah, String pin)` - setor uang (validasi PIN)
- `withdraw(double jumlah, String pin)` - tarik uang (validasi PIN dan saldo)
- `transfer(RekeningBank tujuan, double jumlah, String pin)` - transfer
- `getSaldo(String pin)` - lihat saldo (validasi PIN)
- `gantiPin(String pinLama, String pinBaru)` - ganti PIN

Getters:
- `nomorRekening` - mendapatkan nomor rekening
- `namaPemilik` - mendapatkan nama pemilik

---

## Soal 4: Inheritance - Kendaraan (20 poin)

Buatlah hierarchy class kendaraan:

**Class Parent: `Kendaraan`**
- Properties: `merk`, `model`, `tahun`, `harga`
- Methods: `displayInfo()`, `start()`, `stop()`

**Class Child: `Mobil` extends `Kendaraan`**
- Properties tambahan: `jumlahPintu`, `tipeBahanBakar`
- Override `start()` dan `stop()`
- Method tambahan: `bukaJendela()`, `tutupJendela()`

**Class Child: `Motor` extends `Kendaraan`**
- Properties tambahan: `jenisMotor` (sport/matic/bebek)
- Override `start()` dan `stop()`
- Method tambahan: `wheelie()`

Buat beberapa objek dan demonstrasikan inheritance.

---

## Soal 5: Polymorphism - Sistem Pembayaran (20 poin)

Buatlah abstract class `Payment` dengan:
- Abstract method: `processPayment(double amount)`
- Abstract method: `getPaymentDetails()`

Implementasikan class:
1. `CreditCardPayment` - dengan properties: `cardNumber`, `cvv`, `expiryDate`
2. `EWalletPayment` - dengan properties: `phoneNumber`, `walletProvider`
3. `BankTransferPayment` - dengan properties: `accountNumber`, `bankName`

Buat fungsi `checkout(Payment payment, double amount)` yang menerima berbagai jenis payment.

---

## Soal 6: Abstraction - Media Player (20 poin)

Buatlah abstract class `MediaPlayer` dengan:
- Properties: `title`, `duration`
- Abstract methods: `play()`, `pause()`, `stop()`
- Concrete method: `displayInfo()`

Implementasikan class:
1. `AudioPlayer` - dengan properties: `artist`, `album`, `bitrate`
2. `VideoPlayer` - dengan properties: `resolution`, `format`, `subtitle`

Tambahkan method khusus untuk masing-masing class.

---

## Soal 7: Interface - Sistem Restoran (25 poin)

Buatlah interface (class yang akan diimplement):

**`Orderable`**: `order()`, `cancel()`
**`Payable`**: `calculateTotal()`, `applyDiscount(double percentage)`

Implementasikan class:
1. `MenuItem` implements `Orderable, Payable`
   - Properties: `name`, `price`, `category`
   
2. `Order` 
   - Properties: `items` (List<MenuItem>), `tableNumber`
   - Methods: `addItem()`, `removeItem()`, `getTotalBill()`

Simulasikan proses pemesanan di restoran.

---

## Soal 8: Mixin - Smart Device (25 poin)

Buatlah mixin:

**`WiFiConnectable`**: 
- Properties: `ssid`, `isConnected`
- Methods: `connectWiFi(String ssid)`, `disconnectWiFi()`

**`Bluetooth`**: 
- Properties: `pairedDevices` (List<String>)
- Methods: `pairDevice(String device)`, `unpairDevice(String device)`

**`VoiceControl`**: 
- Methods: `voiceCommand(String command)`

Implementasikan class:
1. `SmartTV` with `WiFiConnectable`, `VoiceControl`
2. `SmartSpeaker` with `WiFiConnectable`, `Bluetooth`, `VoiceControl`
3. `SmartWatch` with `Bluetooth`

---

## Soal 9: Extension Methods - Utility Extensions (20 poin)

Buatlah extension methods untuk:

**`StringUtils` on String:**
- `isValidEmail()` - cek apakah email valid
- `toTitleCase()` - ubah ke title case
- `removeSpaces()` - hapus semua spasi
- `countVowels()` - hitung jumlah huruf vokal

**`ListUtils<T>` on List:**
- `second` getter - ambil elemen kedua
- `removeDuplicates()` - hapus duplikat
- `shuffle()` - acak urutan

**`DateTimeUtils` on DateTime:**
- `isToday()` - cek apakah hari ini
- `formattedDate()` - format tanggal (DD/MM/YYYY)
- `daysDifference(DateTime other)` - selisih hari

---

## Soal 10: Real World - Sistem Perpustakaan (30 poin)

Buatlah sistem perpustakaan lengkap dengan:

**Class `LibraryMember`:**
- Properties: `id`, `name`, `email`, `membershipDate`
- Methods: `borrowBook()`, `returnBook()`, `getActiveBorrows()`

**Abstract class `LibraryItem`:**
- Properties: `id`, `title`, `isAvailable`
- Abstract methods: `borrow(LibraryMember member)`, `returnItem()`

**Class `Book` extends `LibraryItem`:**
- Additional properties: `author`, `isbn`, `publisher`

**Class `Magazine` extends `LibraryItem`:**
- Additional properties: `issue`, `publishDate`

**Class `Library`:**
- Properties: `items` (List<LibraryItem>), `members` (List<LibraryMember>)
- Methods:
  - `addItem(LibraryItem item)`
  - `registerMember(LibraryMember member)`
  - `searchByTitle(String title)`
  - `getAvailableItems()`
  - `generateReport()`

Simulasikan:
1. Menambahkan buku dan majalah
2. Mendaftarkan anggota
3. Peminjaman dan pengembalian
4. Pencarian
5. Laporan perpustakaan

---

## Soal 11: Design Pattern - Factory Pattern (25 poin)

Implementasikan Factory Pattern untuk pembuatan kendaraan:

**Abstract class `Vehicle`:**
- Properties: `type`, `brand`, `price`
- Abstract method: `displaySpecs()`

**Concrete classes:**
- `Car`, `Motorcycle`, `Truck`

**Factory class `VehicleFactory`:**
- Static method: `createVehicle(String type, ...)` yang mengembalikan instance sesuai tipe

Demonstrasikan penggunaan factory untuk membuat berbagai kendaraan.

---

## Soal 12: Composition - Universitas (25 poin)

Buatlah sistem universitas menggunakan composition:

**Class `Address`:**
- Properties: `street`, `city`, `province`, `postalCode`

**Class `Department`:**
- Properties: `name`, `code`, `head`

**Class `Student`:**
- Properties: `name`, `id`, `address` (Address), `department` (Department)
- Composition: Student memiliki Address dan Department

**Class `Course`:**
- Properties: `name`, `code`, `credits`, `department` (Department)

**Class `Enrollment`:**
- Properties: `student` (Student), `courses` (List<Course>), `semester`

Demonstrasikan composition relationship.

---

## Soal Bonus: Game Character System (30 poin)

Buatlah sistem character untuk game RPG:

**Abstract class `Character`:**
- Properties: `name`, `health`, `level`, `experience`
- Abstract method: `attack(Character target)`
- Methods: `takeDamage(int damage)`, `heal(int amount)`, `levelUp()`

**Mixin `MagicAbility`:**
- Properties: `mana`, `spells` (List<String>)
- Methods: `castSpell(String spell)`, `restoreMana(int amount)`

**Mixin `RangedCombat`:**
- Properties: `arrows`, `range`
- Methods: `shootArrow(Character target)`

**Classes:**
1. `Warrior` extends `Character`
2. `Mage` extends `Character` with `MagicAbility`
3. `Archer` extends `Character` with `RangedCombat`
4. `Paladin` extends `Character` with `MagicAbility`

**Class `Battle`:**
- Method: `startBattle(Character char1, Character char2)` - simulasi pertarungan

---

## Penilaian

Total poin: 310 (termasuk bonus 30)

**Grade:**
- A: 260-310
- B: 210-259
- C: 160-209
- D: 110-159
- E: < 110

**Kriteria Penilaian:**
- Implementasi konsep OOP yang benar (40%)
- Code quality dan struktur (30%)
- Handling edge cases (20%)
- Dokumentasi/komentar (10%)

**Tips:**
- Gunakan nama yang deskriptif
- Implementasikan encapsulation dengan baik
- Manfaatkan inheritance dan polymorphism
- Tambahkan validasi yang diperlukan
- Tulis kode yang clean dan maintainable
