class Joke {
  final String category;
  final String type;
  final String setup;
  final String delivery;

  Joke({this.category, this.type, this.setup, this.delivery});

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      category: json['category'],
      type: json['type'],
      setup: json['setup'],
      delivery: json['delivery'],
    );
  }
  String getJoke() {
    print(setup);
    return setup;
  }

  String getAnswer() {
    print(delivery);
    return delivery;
  }
}
