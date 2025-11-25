// ========================================
// JAWABAN LATIHAN OOP DART
// ========================================

void main() {
  print('=== JAWABAN LATIHAN OOP DART ===\n');

  // Uncomment untuk menjalankan soal tertentu

  print('SOAL 1: Class dan Object - Buku Perpustakaan');
  soal1();

  print('\n${'=' * 60}');
  print('SOAL 2: Constructor - Mahasiswa');
  soal2();

  print('\n${'=' * 60}');
  print('SOAL 3: Encapsulation - Rekening Bank');
  soal3();

  print('\n${'=' * 60}');
  print('SOAL 4: Inheritance - Kendaraan');
  soal4();

  print('\n${'=' * 60}');
  print('SOAL 5: Polymorphism - Sistem Pembayaran');
  soal5();

  print('\n${'=' * 60}');
  print('SOAL 6: Abstraction - Media Player');
  soal6();

  print('\n${'=' * 60}');
  print('SOAL 7: Interface - Sistem Restoran');
  soal7();

  print('\n${'=' * 60}');
  print('SOAL 8: Mixin - Smart Device');
  soal8();

  print('\n${'=' * 60}');
  print('SOAL 9: Extension Methods');
  soal9();

  print('\n${'=' * 60}');
  print('SOAL 10: Real World - Sistem Perpustakaan');
  soal10();
}

// ========================================
// SOAL 1: CLASS DAN OBJECT - BUKU PERPUSTAKAAN
// ========================================
class Book {
  String title;
  String author;
  String isbn;
  int year;
  bool isAvailable;

  Book(
    this.title,
    this.author,
    this.isbn,
    this.year, {
    this.isAvailable = true,
  });

  void displayInfo() {
    print('📚 $title');
    print('   Penulis: $author');
    print('   ISBN: $isbn');
    print('   Tahun: $year');
    print('   Status: ${isAvailable ? "Tersedia" : "Dipinjam"}');
  }

  bool borrow() {
    if (isAvailable) {
      isAvailable = false;
      print('✓ Buku "$title" berhasil dipinjam');
      return true;
    } else {
      print('✗ Buku "$title" sedang dipinjam');
      return false;
    }
  }

  void returnBook() {
    isAvailable = true;
    print('✓ Buku "$title" berhasil dikembalikan');
  }
}

void soal1() {
  var book1 = Book('Clean Code', 'Robert C. Martin', '978-0132350884', 2008);
  var book2 = Book('Design Patterns', 'Gang of Four', '978-0201633610', 1994);
  var book3 = Book(
    'The Pragmatic Programmer',
    'Hunt & Thomas',
    '978-0135957059',
    2019,
  );

  print('\n=== DAFTAR BUKU ===');
  book1.displayInfo();
  print('');
  book2.displayInfo();
  print('');
  book3.displayInfo();

  print('\n=== SIMULASI PEMINJAMAN ===');
  book1.borrow();
  book1.borrow(); // Gagal karena sudah dipinjam
  book2.borrow();

  print('\n=== SIMULASI PENGEMBALIAN ===');
  book1.returnBook();
  book1.borrow(); // Berhasil karena sudah dikembalikan
}

// ========================================
// SOAL 2: CONSTRUCTOR - MAHASISWA
// ========================================
class Mahasiswa {
  String nama;
  String nim;
  String jurusan;
  double ipk;

  // Default constructor
  Mahasiswa(this.nama, this.nim, this.jurusan, {this.ipk = 0.0});

  // Named constructor
  Mahasiswa.baru(this.nama, this.nim) : jurusan = 'Belum Ditentukan', ipk = 0.0;

  // Named constructor from Map
  Mahasiswa.fromMap(Map<String, dynamic> map)
    : nama = map['nama'],
      nim = map['nim'],
      jurusan = map['jurusan'] ?? 'Belum Ditentukan',
      ipk = map['ipk'] ?? 0.0;

  void updateIpk(double newIpk) {
    if (newIpk >= 0.0 && newIpk <= 4.0) {
      ipk = newIpk;
      print('✓ IPK $nama diupdate menjadi $ipk');
    } else {
      print('✗ IPK tidak valid (harus 0.0 - 4.0)');
    }
  }

  void displayInfo() {
    print('\n=== INFORMASI MAHASISWA ===');
    print('Nama: $nama');
    print('NIM: $nim');
    print('Jurusan: $jurusan');
    print('IPK: ${ipk.toStringAsFixed(2)}');
  }
}

void soal2() {
  // Default constructor
  var mhs1 = Mahasiswa('Budi Santoso', '2021001', 'Informatika', ipk: 3.75);
  mhs1.displayInfo();

  // Named constructor - baru
  var mhs2 = Mahasiswa.baru('Ani Wijaya', '2024001');
  mhs2.displayInfo();
  mhs2.updateIpk(3.50);

  // Named constructor - fromMap
  var mhs3 = Mahasiswa.fromMap({
    'nama': 'Charlie Brown',
    'nim': '2023005',
    'jurusan': 'Sistem Informasi',
    'ipk': 3.85,
  });
  mhs3.displayInfo();
}

// ========================================
// SOAL 3: ENCAPSULATION - REKENING BANK
// ========================================
class RekeningBank {
  String _nomorRekening;
  String _namaPemilik;
  double _saldo;
  String _pin;

  RekeningBank(this._nomorRekening, this._namaPemilik, this._saldo, this._pin);

  // Getters
  String get nomorRekening => _nomorRekening;
  String get namaPemilik => _namaPemilik;

  bool _validatePin(String pin) {
    return pin == _pin;
  }

  bool deposit(double jumlah, String pin) {
    if (!_validatePin(pin)) {
      print('✗ PIN salah!');
      return false;
    }

    if (jumlah <= 0) {
      print('✗ Jumlah harus lebih dari 0');
      return false;
    }

    _saldo += jumlah;
    print('✓ Deposit Rp ${jumlah.toStringAsFixed(0)} berhasil');
    print('  Saldo: Rp ${_saldo.toStringAsFixed(0)}');
    return true;
  }

  bool withdraw(double jumlah, String pin) {
    if (!_validatePin(pin)) {
      print('✗ PIN salah!');
      return false;
    }

    if (jumlah <= 0) {
      print('✗ Jumlah harus lebih dari 0');
      return false;
    }

    if (jumlah > _saldo) {
      print('✗ Saldo tidak cukup');
      return false;
    }

    _saldo -= jumlah;
    print('✓ Penarikan Rp ${jumlah.toStringAsFixed(0)} berhasil');
    print('  Saldo: Rp ${_saldo.toStringAsFixed(0)}');
    return true;
  }

  bool transfer(RekeningBank tujuan, double jumlah, String pin) {
    if (!_validatePin(pin)) {
      print('✗ PIN salah!');
      return false;
    }

    if (jumlah <= 0) {
      print('✗ Jumlah harus lebih dari 0');
      return false;
    }

    if (jumlah > _saldo) {
      print('✗ Saldo tidak cukup');
      return false;
    }

    _saldo -= jumlah;
    tujuan._saldo += jumlah;
    print(
      '✓ Transfer Rp ${jumlah.toStringAsFixed(0)} ke ${tujuan.namaPemilik} berhasil',
    );
    print('  Saldo: Rp ${_saldo.toStringAsFixed(0)}');
    return true;
  }

  double? getSaldo(String pin) {
    if (!_validatePin(pin)) {
      print('✗ PIN salah!');
      return null;
    }

    print('Saldo rekening $_nomorRekening: Rp ${_saldo.toStringAsFixed(0)}');
    return _saldo;
  }

  bool gantiPin(String pinLama, String pinBaru) {
    if (!_validatePin(pinLama)) {
      print('✗ PIN lama salah!');
      return false;
    }

    if (pinBaru.length != 6) {
      print('✗ PIN baru harus 6 digit');
      return false;
    }

    _pin = pinBaru;
    print('✓ PIN berhasil diganti');
    return true;
  }
}

void soal3() {
  var rek1 = RekeningBank('1234567890', 'John Doe', 5000000, '123456');
  var rek2 = RekeningBank('0987654321', 'Jane Smith', 3000000, '654321');

  print('\n=== TRANSAKSI REKENING ===');
  rek1.getSaldo('123456');

  print('\n--- Deposit ---');
  rek1.deposit(1000000, '123456');

  print('\n--- Penarikan ---');
  rek1.withdraw(500000, '123456');
  rek1.withdraw(10000000, '123456'); // Gagal

  print('\n--- Transfer ---');
  rek1.transfer(rek2, 2000000, '123456');

  print('\n--- Saldo Akhir ---');
  rek1.getSaldo('123456');
  rek2.getSaldo('654321');

  print('\n--- Ganti PIN ---');
  rek1.gantiPin('123456', '999888');
  rek1.getSaldo('999888');
}

// ========================================
// SOAL 4: INHERITANCE - KENDARAAN
// ========================================
class Kendaraan {
  String merk;
  String model;
  int tahun;
  double harga;

  Kendaraan(this.merk, this.model, this.tahun, this.harga);

  void displayInfo() {
    print('$merk $model ($tahun) - Rp ${harga.toStringAsFixed(0)}');
  }

  void start() {
    print('$merk $model dihidupkan');
  }

  void stop() {
    print('$merk $model dimatikan');
  }
}

class Mobil extends Kendaraan {
  int jumlahPintu;
  String tipeBahanBakar;
  bool jendelaStatus = false; // false = tertutup

  Mobil(
    String merk,
    String model,
    int tahun,
    double harga,
    this.jumlahPintu,
    this.tipeBahanBakar,
  ) : super(merk, model, tahun, harga);

  @override
  void start() {
    print('$merk $model: Memutar kunci, mesin menyala');
  }

  @override
  void stop() {
    print('$merk $model: Menekan rem, mesin mati');
  }

  @override
  void displayInfo() {
    super.displayInfo();
    print('  Pintu: $jumlahPintu');
    print('  Bahan Bakar: $tipeBahanBakar');
  }

  void bukaJendela() {
    if (!jendelaStatus) {
      jendelaStatus = true;
      print('$model: Jendela dibuka');
    } else {
      print('$model: Jendela sudah terbuka');
    }
  }

  void tutupJendela() {
    if (jendelaStatus) {
      jendelaStatus = false;
      print('$model: Jendela ditutup');
    } else {
      print('$model: Jendela sudah tertutup');
    }
  }
}

class Motor extends Kendaraan {
  String jenisMotor; // sport/matic/bebek

  Motor(String merk, String model, int tahun, double harga, this.jenisMotor)
    : super(merk, model, tahun, harga);

  @override
  void start() {
    print('$merk $model: Kick starter, mesin menyala');
  }

  @override
  void stop() {
    print('$merk $model: Matikan kontak, mesin mati');
  }

  @override
  void displayInfo() {
    super.displayInfo();
    print('  Jenis: $jenisMotor');
  }

  void wheelie() {
    if (jenisMotor.toLowerCase() == 'sport') {
      print('$model melakukan wheelie! 🏍️');
    } else {
      print('$model ($jenisMotor) tidak cocok untuk wheelie');
    }
  }
}

void soal4() {
  var mobil1 = Mobil('Toyota', 'Avanza', 2023, 250000000, 4, 'Bensin');
  var mobil2 = Mobil('Tesla', 'Model 3', 2024, 800000000, 4, 'Listrik');
  var motor1 = Motor('Honda', 'CBR250RR', 2023, 75000000, 'Sport');
  var motor2 = Motor('Yamaha', 'NMAX', 2023, 35000000, 'Matic');

  print('\n=== DAFTAR KENDARAAN ===');
  print('\nMobil 1:');
  mobil1.displayInfo();

  print('\nMobil 2:');
  mobil2.displayInfo();

  print('\nMotor 1:');
  motor1.displayInfo();

  print('\nMotor 2:');
  motor2.displayInfo();

  print('\n=== DEMONSTRASI INHERITANCE ===');
  mobil1.start();
  mobil1.bukaJendela();
  mobil1.tutupJendela();
  mobil1.stop();

  print('');
  motor1.start();
  motor1.wheelie();
  motor1.stop();

  print('');
  motor2.start();
  motor2.wheelie(); // Tidak cocok untuk wheelie
  motor2.stop();
}

// ========================================
// SOAL 5: POLYMORPHISM - SISTEM PEMBAYARAN
// ========================================
abstract class Payment {
  void processPayment(double amount);
  String getPaymentDetails();
}

class CreditCardPayment implements Payment {
  String cardNumber;
  String cvv;
  String expiryDate;

  CreditCardPayment(this.cardNumber, this.cvv, this.expiryDate);

  @override
  void processPayment(double amount) {
    print('\n💳 Processing Credit Card Payment...');
    print('Amount: Rp ${amount.toStringAsFixed(0)}');
    print('Card: ${_maskCardNumber()}');
    print('✓ Payment successful!');
  }

  @override
  String getPaymentDetails() {
    return 'Credit Card ending in ${cardNumber.substring(cardNumber.length - 4)}';
  }

  String _maskCardNumber() {
    int length = cardNumber.length;
    return '**** **** **** ${cardNumber.substring(length - 4)}';
  }
}

class EWalletPayment implements Payment {
  String phoneNumber;
  String walletProvider;

  EWalletPayment(this.phoneNumber, this.walletProvider);

  @override
  void processPayment(double amount) {
    print('\n📱 Processing E-Wallet Payment...');
    print('Amount: Rp ${amount.toStringAsFixed(0)}');
    print('Provider: $walletProvider');
    print('Phone: $phoneNumber');
    print('✓ Payment successful!');
  }

  @override
  String getPaymentDetails() {
    return '$walletProvider ($phoneNumber)';
  }
}

class BankTransferPayment implements Payment {
  String accountNumber;
  String bankName;

  BankTransferPayment(this.accountNumber, this.bankName);

  @override
  void processPayment(double amount) {
    print('\n🏦 Processing Bank Transfer...');
    print('Amount: Rp ${amount.toStringAsFixed(0)}');
    print('Bank: $bankName');
    print('Account: $accountNumber');
    print('✓ Payment successful!');
  }

  @override
  String getPaymentDetails() {
    return '$bankName - $accountNumber';
  }
}

void checkout(Payment payment, double amount) {
  print('\n═══ CHECKOUT ═══');
  print('Payment Method: ${payment.getPaymentDetails()}');
  payment.processPayment(amount);
}

void soal5() {
  var creditCard = CreditCardPayment('1234567890123456', '123', '12/25');
  var ewallet = EWalletPayment('081234567890', 'GoPay');
  var bankTransfer = BankTransferPayment('9876543210', 'BCA');

  checkout(creditCard, 500000);
  checkout(ewallet, 250000);
  checkout(bankTransfer, 1000000);
}

// ========================================
// SOAL 6: ABSTRACTION - MEDIA PLAYER
// ========================================
abstract class MediaPlayer {
  String title;
  int duration; // dalam detik

  MediaPlayer(this.title, this.duration);

  void play();
  void pause();
  void stop();

  void displayInfo() {
    int minutes = duration ~/ 60;
    int seconds = duration % 60;
    print('Title: $title');
    print('Duration: ${minutes}m ${seconds}s');
  }
}

class AudioPlayer extends MediaPlayer {
  String artist;
  String album;
  int bitrate; // kbps

  AudioPlayer(String title, int duration, this.artist, this.album, this.bitrate)
    : super(title, duration);

  @override
  void play() {
    print('🎵 Playing audio: $title by $artist');
  }

  @override
  void pause() {
    print('⏸️  Audio paused: $title');
  }

  @override
  void stop() {
    print('⏹️  Audio stopped: $title');
  }

  @override
  void displayInfo() {
    print('\n=== AUDIO INFO ===');
    super.displayInfo();
    print('Artist: $artist');
    print('Album: $album');
    print('Bitrate: ${bitrate}kbps');
  }

  void adjustEqualizer(String preset) {
    print('🎚️  Equalizer set to: $preset');
  }
}

class VideoPlayer extends MediaPlayer {
  String resolution;
  String format;
  bool subtitle;

  VideoPlayer(
    String title,
    int duration,
    this.resolution,
    this.format, {
    this.subtitle = false,
  }) : super(title, duration);

  @override
  void play() {
    print('🎬 Playing video: $title');
    if (subtitle) print('   [Subtitles: ON]');
  }

  @override
  void pause() {
    print('⏸️  Video paused: $title');
  }

  @override
  void stop() {
    print('⏹️  Video stopped: $title');
  }

  @override
  void displayInfo() {
    print('\n=== VIDEO INFO ===');
    super.displayInfo();
    print('Resolution: $resolution');
    print('Format: $format');
    print('Subtitles: ${subtitle ? "Available" : "Not available"}');
  }

  void toggleSubtitle() {
    subtitle = !subtitle;
    print('📝 Subtitles: ${subtitle ? "ON" : "OFF"}');
  }

  void changeQuality(String newResolution) {
    resolution = newResolution;
    print('⚙️  Quality changed to: $resolution');
  }
}

void soal6() {
  var audio = AudioPlayer(
    'Bohemian Rhapsody',
    354,
    'Queen',
    'A Night at the Opera',
    320,
  );
  var video = VideoPlayer('Inception', 8880, '1080p', 'MP4', subtitle: true);

  audio.displayInfo();
  audio.play();
  audio.adjustEqualizer('Rock');
  audio.pause();
  audio.stop();

  video.displayInfo();
  video.play();
  video.changeQuality('4K');
  video.toggleSubtitle();
  video.pause();
  video.stop();
}

// ========================================
// SOAL 7: INTERFACE - SISTEM RESTORAN
// ========================================
abstract class Orderable {
  void order();
  void cancel();
}

abstract class Payable {
  double calculateTotal();
  void applyDiscount(double percentage);
}

class MenuItem implements Orderable, Payable {
  String name;
  double price;
  String category;
  int quantity = 0;
  double discount = 0;

  MenuItem(this.name, this.price, this.category);

  @override
  void order() {
    quantity++;
    print('✓ Ordered: $name x$quantity');
  }

  @override
  void cancel() {
    if (quantity > 0) {
      quantity--;
      print('✗ Cancelled: $name (remaining: $quantity)');
    } else {
      print('✗ No $name to cancel');
    }
  }

  @override
  double calculateTotal() {
    double total = price * quantity;
    double discountAmount = total * (discount / 100);
    return total - discountAmount;
  }

  @override
  void applyDiscount(double percentage) {
    discount = percentage;
    print('💰 Discount $percentage% applied to $name');
  }

  void displayItem() {
    print('$name - Rp ${price.toStringAsFixed(0)} [$category]');
    if (quantity > 0) {
      print('  Quantity: $quantity');
      if (discount > 0) {
        print('  Discount: $discount%');
      }
      print('  Subtotal: Rp ${calculateTotal().toStringAsFixed(0)}');
    }
  }
}

class Order {
  List<MenuItem> items = [];
  int tableNumber;

  Order(this.tableNumber);

  void addItem(MenuItem item) {
    var existing = items.firstWhere(
      (i) => i.name == item.name,
      orElse: () => item,
    );

    if (!items.contains(existing)) {
      items.add(item);
    }

    item.order();
  }

  void removeItem(String itemName) {
    var item = items.firstWhere(
      (i) => i.name == itemName,
      orElse: () => MenuItem('', 0, ''),
    );

    if (item.name.isNotEmpty) {
      item.cancel();
      if (item.quantity == 0) {
        items.remove(item);
      }
    }
  }

  double getTotalBill() {
    return items.fold(0, (sum, item) => sum + item.calculateTotal());
  }

  void displayOrder() {
    print('\n═══ ORDER - TABLE $tableNumber ═══');
    if (items.isEmpty) {
      print('No items ordered');
      return;
    }

    for (var item in items) {
      item.displayItem();
    }
    print('─────────────────────');
    print('TOTAL: Rp ${getTotalBill().toStringAsFixed(0)}');
  }
}

void soal7() {
  var nasiGoreng = MenuItem('Nasi Goreng Spesial', 25000, 'Main Course');
  var mieGoreng = MenuItem('Mie Goreng', 20000, 'Main Course');
  var esTeh = MenuItem('Es Teh Manis', 5000, 'Beverage');
  var jusJeruk = MenuItem('Jus Jeruk', 15000, 'Beverage');

  var order = Order(5);

  print('\n=== SIMULASI PEMESANAN RESTORAN ===');
  order.addItem(nasiGoreng);
  order.addItem(nasiGoreng); // order 2
  order.addItem(mieGoreng);
  order.addItem(esTeh);
  order.addItem(esTeh);
  order.addItem(jusJeruk);

  order.displayOrder();

  print('\n--- Apply Discount ---');
  nasiGoreng.applyDiscount(10);

  order.displayOrder();

  print('\n--- Remove Item ---');
  order.removeItem('Es Teh Manis');

  order.displayOrder();
}

// ========================================
// SOAL 8: MIXIN - SMART DEVICE
// ========================================
mixin WiFiConnectable {
  String? ssid;
  bool isConnected = false;

  void connectWiFi(String networkSsid) {
    ssid = networkSsid;
    isConnected = true;
    print('📶 Connected to WiFi: $ssid');
  }

  void disconnectWiFi() {
    print('📶 Disconnected from WiFi: $ssid');
    ssid = null;
    isConnected = false;
  }
}

mixin Bluetooth {
  List<String> pairedDevices = [];

  void pairDevice(String device) {
    if (!pairedDevices.contains(device)) {
      pairedDevices.add(device);
      print('🔵 Paired with: $device');
    } else {
      print('🔵 Already paired with: $device');
    }
  }

  void unpairDevice(String device) {
    if (pairedDevices.contains(device)) {
      pairedDevices.remove(device);
      print('🔵 Unpaired: $device');
    } else {
      print('🔵 Device not found: $device');
    }
  }

  void listPairedDevices() {
    if (pairedDevices.isEmpty) {
      print('🔵 No paired devices');
    } else {
      print('🔵 Paired devices: ${pairedDevices.join(', ')}');
    }
  }
}

mixin VoiceControl {
  void voiceCommand(String command) {
    print('🎤 Voice command: "$command"');
    _processCommand(command.toLowerCase());
  }

  void _processCommand(String command) {
    if (command.contains('turn on')) {
      print('   → Turning on...');
    } else if (command.contains('turn off')) {
      print('   → Turning off...');
    } else if (command.contains('volume')) {
      print('   → Adjusting volume...');
    } else {
      print('   → Command not recognized');
    }
  }
}

class SmartTV with WiFiConnectable, VoiceControl {
  String brand;
  int size;
  bool isPoweredOn = false;

  SmartTV(this.brand, this.size);

  void turnOn() {
    isPoweredOn = true;
    print('📺 $brand TV turned ON');
  }

  void turnOff() {
    isPoweredOn = false;
    print('📺 $brand TV turned OFF');
  }

  void displayInfo() {
    print('\n=== SMART TV ===');
    print('Brand: $brand');
    print('Size: $size"');
    print('Power: ${isPoweredOn ? "ON" : "OFF"}');
    print('WiFi: ${isConnected ? "Connected ($ssid)" : "Not connected"}');
  }
}

class SmartSpeaker with WiFiConnectable, Bluetooth, VoiceControl {
  String brand;
  String model;
  int volume = 50;

  SmartSpeaker(this.brand, this.model);

  void playMusic(String song) {
    print('🔊 Playing: $song (Volume: $volume%)');
  }

  void setVolume(int level) {
    volume = level.clamp(0, 100);
    print('🔊 Volume set to: $volume%');
  }

  void displayInfo() {
    print('\n=== SMART SPEAKER ===');
    print('Brand: $brand $model');
    print('Volume: $volume%');
    print('WiFi: ${isConnected ? "Connected ($ssid)" : "Not connected"}');
    listPairedDevices();
  }
}

class SmartWatch with Bluetooth {
  String brand;
  String model;
  int batteryLevel = 100;

  SmartWatch(this.brand, this.model);

  void trackActivity(String activity) {
    print('⌚ Tracking: $activity');
    batteryLevel -= 5;
  }

  void displayInfo() {
    print('\n=== SMART WATCH ===');
    print('Brand: $brand $model');
    print('Battery: $batteryLevel%');
    listPairedDevices();
  }
}

void soal8() {
  var tv = SmartTV('Samsung', 55);
  tv.turnOn();
  tv.connectWiFi('HomeNetwork');
  tv.voiceCommand('Turn on Netflix');
  tv.displayInfo();

  var speaker = SmartSpeaker('Google', 'Home Max');
  speaker.connectWiFi('HomeNetwork');
  speaker.pairDevice('iPhone 15');
  speaker.pairDevice('MacBook Pro');
  speaker.playMusic('Bohemian Rhapsody');
  speaker.voiceCommand('Volume up');
  speaker.setVolume(70);
  speaker.displayInfo();

  var watch = SmartWatch('Apple', 'Watch Series 9');
  watch.pairDevice('iPhone 15');
  watch.trackActivity('Running');
  watch.trackActivity('Cycling');
  watch.displayInfo();
}

// ========================================
// SOAL 9: EXTENSION METHODS
// ========================================
extension StringUtils on String {
  bool isValidEmail() {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(this);
  }

  String toTitleCase() {
    if (isEmpty) return this;
    return split(' ')
        .map(
          (word) => word.isEmpty
              ? ''
              : '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}',
        )
        .join(' ');
  }

  String removeSpaces() {
    return replaceAll(' ', '');
  }

  int countVowels() {
    return toLowerCase()
        .split('')
        .where((char) => 'aiueo'.contains(char))
        .length;
  }
}

extension ListUtils<T> on List<T> {
  T? get second => length >= 2 ? this[1] : null;

  List<T> removeDuplicates() {
    return toSet().toList();
  }

  List<T> shuffled() {
    var shuffled = [...this];
    shuffled.shuffle();
    return shuffled;
  }
}

extension DateTimeUtils on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  String formattedDate() {
    String pad(int n) => n.toString().padLeft(2, '0');
    return '${pad(day)}/${pad(month)}/$year';
  }

  int daysDifference(DateTime other) {
    return difference(other).inDays.abs();
  }
}

void soal9() {
  print('\n=== STRING EXTENSIONS ===');
  print('Email validation:');
  print(
    '  "test@email.com".isValidEmail() = ${'test@email.com'.isValidEmail()}',
  );
  print('  "invalid.email".isValidEmail() = ${'invalid.email'.isValidEmail()}');

  print('\nTitle case:');
  print('  "hello world".toTitleCase() = ${'hello world'.toTitleCase()}');

  print('\nRemove spaces:');
  print('  "hello world".removeSpaces() = ${'hello world'.removeSpaces()}');

  print('\nCount vowels:');
  print('  "programming".countVowels() = ${'programming'.countVowels()}');

  print('\n=== LIST EXTENSIONS ===');
  var numbers = [1, 2, 3, 4, 5];
  print('List: $numbers');
  print('Second element: ${numbers.second}');

  var withDuplicates = [1, 2, 2, 3, 3, 3, 4, 5];
  print('\nWith duplicates: $withDuplicates');
  print('Remove duplicates: ${withDuplicates.removeDuplicates()}');

  print('\nShuffled: ${numbers.shuffled()}');

  print('\n=== DATETIME EXTENSIONS ===');
  var today = DateTime.now();
  var yesterday = today.subtract(Duration(days: 1));
  var future = today.add(Duration(days: 30));

  print('Today: ${today.formattedDate()}');
  print('Is today: ${today.isToday()}');
  print('Yesterday: ${yesterday.formattedDate()}');
  print('Is yesterday today: ${yesterday.isToday()}');
  print('Days difference (today - future): ${today.daysDifference(future)}');
}

// ========================================
// SOAL 10: REAL WORLD - SISTEM PERPUSTAKAAN
// ========================================
class LibraryMember {
  String id;
  String name;
  String email;
  DateTime membershipDate;
  List<LibraryItem> borrowedItems = [];

  LibraryMember(this.id, this.name, this.email, this.membershipDate);

  void borrowBook(LibraryItem item) {
    borrowedItems.add(item);
  }

  void returnBook(LibraryItem item) {
    borrowedItems.remove(item);
  }

  List<LibraryItem> getActiveBorrows() {
    return borrowedItems;
  }

  void displayInfo() {
    print('\n=== MEMBER INFO ===');
    print('ID: $id');
    print('Name: $name');
    print('Email: $email');
    print('Member since: ${membershipDate.year}');
    print('Active borrows: ${borrowedItems.length}');
  }
}

abstract class LibraryItem {
  String id;
  String title;
  bool isAvailable;

  LibraryItem(this.id, this.title, {this.isAvailable = true});

  void borrow(LibraryMember member);
  void returnItem();
  void displayInfo();
}

class LibraryBook extends LibraryItem {
  String author;
  String isbn;
  String publisher;

  LibraryBook(String id, String title, this.author, this.isbn, this.publisher)
    : super(id, title);

  @override
  void borrow(LibraryMember member) {
    if (isAvailable) {
      isAvailable = false;
      member.borrowBook(this);
      print('✓ Book "$title" borrowed by ${member.name}');
    } else {
      print('✗ Book "$title" is not available');
    }
  }

  @override
  void returnItem() {
    isAvailable = true;
    print('✓ Book "$title" returned');
  }

  @override
  void displayInfo() {
    print('📚 Book: $title');
    print('   Author: $author');
    print('   ISBN: $isbn');
    print('   Publisher: $publisher');
    print('   Status: ${isAvailable ? "Available" : "Borrowed"}');
  }
}

class Magazine extends LibraryItem {
  String issue;
  DateTime publishDate;

  Magazine(String id, String title, this.issue, this.publishDate)
    : super(id, title);

  @override
  void borrow(LibraryMember member) {
    if (isAvailable) {
      isAvailable = false;
      member.borrowBook(this);
      print('✓ Magazine "$title" (Issue $issue) borrowed by ${member.name}');
    } else {
      print('✗ Magazine "$title" is not available');
    }
  }

  @override
  void returnItem() {
    isAvailable = true;
    print('✓ Magazine "$title" returned');
  }

  @override
  void displayInfo() {
    print('📰 Magazine: $title');
    print('   Issue: $issue');
    print('   Publish Date: ${publishDate.year}-${publishDate.month}');
    print('   Status: ${isAvailable ? "Available" : "Borrowed"}');
  }
}

class Library {
  List<LibraryItem> items = [];
  List<LibraryMember> members = [];

  void addItem(LibraryItem item) {
    items.add(item);
    print('✓ Item "${item.title}" added to library');
  }

  void registerMember(LibraryMember member) {
    members.add(member);
    print('✓ Member "${member.name}" registered');
  }

  List<LibraryItem> searchByTitle(String title) {
    return items
        .where((item) => item.title.toLowerCase().contains(title.toLowerCase()))
        .toList();
  }

  List<LibraryItem> getAvailableItems() {
    return items.where((item) => item.isAvailable).toList();
  }

  void generateReport() {
    print('\n═══ LIBRARY REPORT ═══');
    print('Total Items: ${items.length}');
    print('Total Members: ${members.length}');

    int available = items.where((item) => item.isAvailable).length;
    int borrowed = items.length - available;

    print('\nItems Status:');
    print('  Available: $available');
    print('  Borrowed: $borrowed');

    print('\nMost Active Members:');
    var sortedMembers = [...members];
    sortedMembers.sort(
      (a, b) => b.borrowedItems.length.compareTo(a.borrowedItems.length),
    );

    for (var member in sortedMembers.take(3)) {
      print('  ${member.name}: ${member.borrowedItems.length} items');
    }
  }
}

void soal10() {
  var library = Library();

  // Add items
  print('\n=== MENAMBAH KOLEKSI ===');
  library.addItem(
    LibraryBook(
      'B001',
      'Clean Code',
      'Robert Martin',
      '978-0132350884',
      'Prentice Hall',
    ),
  );
  library.addItem(
    LibraryBook(
      'B002',
      'Design Patterns',
      'Gang of Four',
      '978-0201633610',
      'Addison-Wesley',
    ),
  );
  library.addItem(
    LibraryBook(
      'B003',
      'The Pragmatic Programmer',
      'Hunt & Thomas',
      '978-0135957059',
      'Addison-Wesley',
    ),
  );
  library.addItem(
    Magazine('M001', 'Tech Monthly', 'January 2024', DateTime(2024, 1, 1)),
  );
  library.addItem(
    Magazine('M002', 'Science Today', 'February 2024', DateTime(2024, 2, 1)),
  );

  // Register members
  print('\n=== REGISTRASI ANGGOTA ===');
  var member1 = LibraryMember(
    'MEM001',
    'Alice Johnson',
    'alice@email.com',
    DateTime(2023, 1, 15),
  );
  var member2 = LibraryMember(
    'MEM002',
    'Bob Smith',
    'bob@email.com',
    DateTime(2023, 6, 20),
  );
  library.registerMember(member1);
  library.registerMember(member2);

  // Borrow items
  print('\n=== PEMINJAMAN ===');
  library.items[0].borrow(member1);
  library.items[1].borrow(member1);
  library.items[3].borrow(member2);

  // Search
  print('\n=== PENCARIAN ===');
  var searchResults = library.searchByTitle('clean');
  print('Search results for "clean":');
  for (var item in searchResults) {
    item.displayInfo();
  }

  // Available items
  print('\n=== ITEM TERSEDIA ===');
  var available = library.getAvailableItems();
  print('${available.length} items available:');
  for (var item in available) {
    print('  - ${item.title}');
  }

  // Return item
  print('\n=== PENGEMBALIAN ===');
  library.items[0].returnItem();
  member1.returnBook(library.items[0]);

  // Generate report
  library.generateReport();

  // Member info
  member1.displayInfo();
}
