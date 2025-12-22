void main() {
  String nama = "Ahmad Rifqi Hendriansyah";
  String nim = "2341720134";

  for (int i = 0; i <= 201; i++) {
    if (isPrima(i)) {
      print("$i adalah bilangan prima -> $nama ($nim)");
    }
  }
}

// Fungsi untuk cek bilangan prima
bool isPrima(int n) {
  if (n < 2) return false;
  for (int i = 2; i <= n ~/ 2; i++) {
    if (n % i == 0) return false;
  }
  return true;
}
