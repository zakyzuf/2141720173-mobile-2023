void main() {
  for (int angka = 0; angka <= 201; angka++) {
    if (angka <= 1) {
      continue; 
    }
    bool isPrima = true;
    for (int i = 2; i <= angka ~/ 2; i++) {
      if (angka % i == 0) {
        isPrima = false;
        break;
      }
    }
    if (isPrima) {
      print("$angka Mochammad Zaky Zamroni - 2141720173");
    }
  }
}
