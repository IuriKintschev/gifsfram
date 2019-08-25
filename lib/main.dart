import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:gifsgram/blocs/favorite_bloc.dart';
import 'package:gifsgram/blocs/gifs_bloc.dart';
import 'package:gifsgram/ui/home/home_ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((_) => GifsBloc()),
        Bloc((_) => FavoriteBloc()),
      ],
      child: MaterialApp(
        title: "Gifsgram",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromARGB(255, 4, 211, 97),
          primaryColorDark: Color(0xff222222),
        ),
        home: HomeUi(),
      ),
    );
  }
}
