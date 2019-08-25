import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:gifsgram/data/gife_data.dart';

class FavoriteBloc implements BlocBase {
  Map<String, Gifs> _favorites = {};

  final StreamController<Map<String, Gifs>> _favController =
      new StreamController<
          Map<String, Gifs>>.broadcast(); // saida dos favoritos
  Stream<Map<String, Gifs>> get outFav => _favController.stream;

  void toogleFav(Gifs gif) {
    if (_favorites.containsKey(gif.id)) {
      _favorites.remove(gif.id);
    } else {
      _favorites[gif.id] = gif;
    }

    _favController.sink.add(_favorites);
  }

  @override
  void dispose() {
    // dispose
    _favController.close();
  }

  //=======================================
  //todo: implementaçao bloc
  @override
  void addListener(listener) {
    // addListener
  }

  @override
  // hasListeners
  bool get hasListeners => null;

  @override
  void notifyListeners() {
    // notifyListeners
  }

  @override
  void removeListener(listener) {
    // removeListener
  }
  //=======================================
}
