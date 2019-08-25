class Gifs {
  final String title;
  final String imageSmall;
  final String imageOriginal;
  final String id;

  Gifs({this.title, this.imageSmall, this.imageOriginal, this.id});

  factory Gifs.fromJson(Map<String, dynamic> json) {
    return Gifs(
        id: json["id"],
        title: json["title"],
        imageSmall: json["images"]["fixed_width"]["url"],
        imageOriginal: json["images"]["original"]["url"]);
  }
}
