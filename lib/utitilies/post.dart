class Post {
  final condition;
  final temperature;
  final cityName;

  Post({this.condition, this.cityName, this.temperature});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      condition: json['weather'][0]['id'],
      temperature: json['main']['temp'],
      cityName: json['name'],
    );
  }
}
