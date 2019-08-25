import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';

import 'package:gifsgram/api.dart';
import 'package:gifsgram/data/gife_data.dart';

class GifsBloc implements BlocBase {
  Api api;

  GifsBloc() {
    api = new Api();

    _searchController.stream.listen(_search);
  }

  List<Gifs> gifs;

  final StreamController _gifsController = new StreamController();
  Stream get outGifs => _gifsController.stream;

  final _searchController = new StreamController();
  Sink get inSearch => _searchController.sink;

  void _search(String search) async {
    gifs = await api.searchGifs(search);

    print(gifs);
  }

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
