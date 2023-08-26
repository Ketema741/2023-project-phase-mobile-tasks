import 'dart:async';

void main() async {
  List<String> posts = await fetchData();
  print(posts);
}

FutureOr<List<String>> fetchData() {
  if (cashedData().isNotEmpty) {
    return cashedData();
  } else {
    return fetchData();
  }
}

Future<List<String>> fetchPost() {
  return Future.delayed(
    const Duration(seconds: 1),
    () => ["Task 1", "Task2"],
  );
}

List<String> cashedData() {
  return ["cashed"];
}
