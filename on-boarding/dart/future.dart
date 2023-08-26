void main() async {
  looser().then((message) {
    print(message);
    return womenizer().then((post) => print(post));
  });
  print("break");
  try {
    String message = await looser();
    print("hi mr. $message");
    List<String> post = await womenizer();
    print("posts: $post");
  } catch (e) {
    print(e);
  }
  print("last");
}

Future<String> bukwoski() async {
  Future.delayed(Duration(seconds: 1));
  return "The Subtle of not givin a fuckk";
}

Future<String> looser() {
  return Future.delayed(
    const Duration(seconds: 1),
    () => "hellow",
  );
}

Future<List<String>> womenizer() {
  return Future.delayed(
      const Duration(seconds: 1),
      () => [
            "hellow",
            "hellow",
            "hellow",
            "hellow",
          ]);
}
