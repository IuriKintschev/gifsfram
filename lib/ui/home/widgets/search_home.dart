import 'package:flutter/material.dart';

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
  Widget buildResults(BuildContext context) {
    // buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // buildSuggestions
    return Container();
  }
}
