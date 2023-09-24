void main() {
  final List<String?> list = List.filled(5, null);
  list[1] = 'Nama: Mochammad Zaky Zamroni';
  list[2] = 'NIM: 2141720173';

  assert(list.length == 5);
  assert(list[1] == 'Nama: Mochammad Zaky Zamroni');
  assert(list[2] == 'NIM: 2141720173');


  print(list[1]);
  print(list[2]);
}
