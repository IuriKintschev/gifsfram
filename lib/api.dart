import 'dart:convert';

import 'package:http/http.dart' as http;

import 'data/gife_data.dart';

class Api {
  String _currentSearch;

  String initial =
      "https://api.giphy.com/v1/gifs/trending?api_key=POZsuGiuZFAcYnHeHIq2TtwzKTzu1DPl&limit=10&rating=G";

  initialSearch() async {
    http.Response response = await http.get(initial);

    return decode(response);
  }

  Future<List<Gifs>> searchGifs(String search) async {
    http.Response response = await http.get(
        "https://api.giphy.com/v1/gifs/search?api_key=POZsuGiuZFAcYnHeHIq2TtwzKTzu1DPl&q=$search&limit=10&offset=0&rating=G&lang=pt");

    return decode(response);
  }

  Future<List<Gifs>> nextPage(int offset) async {
    http.Response response = await http.get(
        "https://api.giphy.com/v1/gifs/search?api_key=POZsuGiuZFAcYnHeHIq2TtwzKTzu1DPl&q=$_currentSearch&limit=10&offset=$offset&rating=G&lang=pt");

    return decode(response);
  }

  List<Gifs> decode(http.Response response) {
    if (response.statusCode == 200) {
      var decode = json.decode(response.body);

      List<Gifs> gifs = decode["data"].map<Gifs>((map) {
        return Gifs.fromJson(map);
      }).toList();
      return gifs;
    } else {
      throw Exception("Error on load of gifs");
    }
  }
}
