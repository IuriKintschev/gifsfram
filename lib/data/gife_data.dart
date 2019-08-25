class Gifs {
  final String title;
  final String imageSmall;
  final String imageOriginal;

  Gifs({this.title, this.imageSmall, this.imageOriginal});

  factory Gifs.fromJson(Map<String, dynamic> json) {
    return Gifs(
        title: json["title"],
        imageSmall: json["images"]["fixed_width"]["url"],
        imageOriginal: json["images"]["original"]["url"]);
  }
}
