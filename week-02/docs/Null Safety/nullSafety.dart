void main() {

  String nullableString;
  String nonNullableString = "Hello, Zaky";
  
  printText(nullableString);
  printText(nonNullableString);

}

void printText(String? text) {
  if (text != null) {
    print(text);
  } else {
    print("Text is null.");
  }
}

