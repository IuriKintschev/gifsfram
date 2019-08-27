class Gifs {
  final String title;
  final String imageSmall;
  final String imageOriginal;
  final String id;

  Gifs({this.title, this.imageSmall, this.imageOriginal, this.id});

  factory Gifs.fromJson(Map<String, dynamic> json) {
    if (json.containsKey("id")) {
      return Gifs(
          id: json["id"],
          title: json["title"],
          imageSmall: json["images"]["fixed_width"]["url"],
          imageOriginal: json["images"]["original"]["url"]);
    } else {
      return Gifs(
          id: json["gifsId"],
          title: json["title"],
          imageSmall: json["imageSmall"],
          imageOriginal: json["imageOriginal"]);
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "gifsId": id,
      "title": title,
      "imageSmall": imageSmall,
      "imageOriginal": imageOriginal
    };
  }
}
