void main() {
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 2
  };

  var mhs1 = Map<String, String>();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  var mhs2 = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  gifts['Nama'] = 'Mochammad Zaky Zamroni';
  gifts['NIM'] = '2141720173';

  nobleGases[3] = 'Nama = Mochammad Zaky Zamroni';
  nobleGases[4] = 'NIM = 2141720173';

  mhs1['Nama'] = 'Mochammad Zaky Zamroni';
  mhs1['NIM'] = '2141720173';

  mhs2[3] = 'Nama = Mochammad Zaky Zamroni';
  mhs2[4] = 'NIM = 2141720173';

  print(gifts);
  print(nobleGases);
  print(mhs1);
  print(mhs2);
}
