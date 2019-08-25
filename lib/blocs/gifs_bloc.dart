import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';

import 'package:gifsgram/api.dart';
import 'package:gifsgram/data/gife_data.dart';

class GifsBloc implements BlocBase {
  Api api;

  GifsBloc() {
    api = new Api();
  }

  List<Gifs> gifs;

  final StreamController _gifsController = new StreamController();

  @override
  void addListener(listener) {
    //addListener
  }

  @override
  void dispose() {
    //dispose
    _gifsController.close();
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
