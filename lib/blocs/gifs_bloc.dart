import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';

import 'package:gifsgram/api.dart';
import 'package:gifsgram/data/gife_data.dart';

class GifsBloc implements BlocBase {
  Api api;

  GifsBloc() {
    api = new Api();

    _searchController.stream.listen(_search); //! cahamando search api.dart
  }

  List<Gifs> gifs; //! gifs

  final StreamController<List<Gifs>> _gifsController =
      new StreamController<List<Gifs>>();
  Stream get outGifs => _gifsController.stream; //! saida  de gifs

  final StreamController<String> _searchController =
      new StreamController<String>();
  Sink get inSearch => _searchController.sink; //! entrada de gifs

  //! recupera search da api.dart e insere outGifs
  void _search(String search) async {
    gifs = await api.searchGifs(search);

    _gifsController.sink.add(gifs);
  }

  //! finalisando streams
  @override
  void dispose() {
    //dispose
    _gifsController.close();
    _searchController.close();
  }

  @override
  void addListener(listener) {
    //addListener
  }

  @override
  //hasListeners
  bool get hasListeners => null;

  @override
  void notifyListeners() {
    //notifyListeners
  }

  @override
  void removeListener(listener) {
    //removeListener
  }
}
