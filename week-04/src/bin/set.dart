void main() {
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print(halogens);

  var names1 = <String>{};
  Set<String> names2 = {};
  // var names3 = {}; // Creates a map, not a set.

  names1.add('Nama: Mochammad Zaky Zamroni');
  names1.add('NIM: 2141720173');
  names2.addAll({'Nama: Mochammad Zaky Zamroni', 'NIM: 2141720173'});

  print(names1);
  print(names2);
  // print(names3);
}

