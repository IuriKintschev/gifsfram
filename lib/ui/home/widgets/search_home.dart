import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // buildActions
    return [
      IconButton(
        //! botao de exclusao
        icon: Icon(
          Icons.clear,
        ),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // buildLeading
    return IconButton(
      //! botao de voltar animado
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  buildResults(BuildContext context) {
    // buildResults
    Future.delayed(Duration.zero).then((_) => close(context, query));

    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // buildSuggestions
    if (query.isEmpty) {
      return Container();
    } else {
      return FutureBuilder(
        future: suggestions(query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    snapshot.data[index],
                  ),
                  leading: Icon(
                    Icons.keyboard_arrow_right,
                  ),
                  onTap: () {
                    query = snapshot.data[index];
                  },
                );
              },
              itemCount: snapshot.data.length,
            );
          }
        },
      );
    }
  }

  //!retornando sugestoes
  Future<List> suggestions(String search) async {
    http.Response response = await http.get(
        "https://api.giphy.com/v1/gifs/search?api_key=POZsuGiuZFAcYnHeHIq2TtwzKTzu1DPl&q=$search&limit=10&offset=0&rating=G&lang=pt");

    if (response.statusCode == 200) {
      return json.decode(response.body)["data"].map((map) {
        return map["title"];
      }).toList();
    } else {
      throw Exception("Failed to load suggestion");
    }
  }
}
