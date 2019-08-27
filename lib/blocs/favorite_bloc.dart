import 'dart:async';
import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:gifsgram/data/gife_data.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteBloc implements BlocBase {
  Map<String, Gifs> _favorites = {};

  FavoriteBloc() {
    SharedPreferences.getInstance().then((prefs) {
      if (prefs.getKeys().contains("favorites")) {
        _favorites = json.decode(prefs.getString("favorites")).map((k, v) {
          return MapEntry(k, Gifs.fromJson(v));
        }).cast<String, Gifs>();

        _favController.add(_favorites);
      }
    });
  }

  final _favController =
      new BehaviorSubject<Map<String, Gifs>>(); // saida dos favoritos
  Stream<Map<String, Gifs>> get outFav => _favController.stream;

  void toogleFav(Gifs gif) {
    if (_favorites.containsKey(gif.id)) {
      _favorites.remove(gif.id);
    } else {
      _favorites[gif.id] = gif;
    }

    _favController.sink.add(_favorites);

    _saveFav();
  }

  void _saveFav() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString("favorites", json.encode(_favorites));
    });
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
