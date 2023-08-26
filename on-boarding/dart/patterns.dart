// what is new in dart 3 ? Patterns
void main() {
  // final userInfo = getUserInfo();
  final (:name, :age) = getUserInfo();
  print((name, age));
}

({int age, String name}) getUserInfo() {
  return (age: 12, name: "ketema");
}
