void main() {
  var record = ('first', a: 2, b: true, 'last');
  print(record);


  var record1 = (1, 2);
  print(record1);
  print(tukar(record1));


  (String, int) mahasiswa = ('Mochammad Zaky Zamroni', 2141720173);
  print(mahasiswa);


  var mahasiswa2 = (mahasiswa.$1, a: 2, b: true, mahasiswa.$2);
  print(mahasiswa2.$1); // Prints 'first'
  print(mahasiswa2.a); // Prints 2
  print(mahasiswa2.b); // Prints true
  print(mahasiswa2.$2); // Prints 'last'
}

(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}
