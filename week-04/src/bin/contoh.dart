void cetakPesan(String Function(String) pesanFunction) {
  var pesan = pesanFunction("Dunia");
  print(pesan);
}

String salam(String nama) {
  return "Halo, $nama!";
}

void main() {
  cetakPesan(salam);
}