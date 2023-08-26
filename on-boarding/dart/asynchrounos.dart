import 'dart:async';

// An asynchronous function that simulates fetching data from a server
Future<String> fetchDataFromServer() async {
  // Simulate a delay to mimic network request
  await Future.delayed(Duration(seconds: 2));
  return 'Data from server';
}

void main() async {
  print('Program started');

  // Start fetching data asynchronously
  String dataFuture = await fetchDataFromServer();

  // While waiting for data to arrive, do other tasks
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 2));
    print('Doing task $i');
  }

  // Wait for data to finish fetching
  String data = await dataFuture;
  print('Fetched data: $data');

  print('Program ended');
}
