import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:gifsgram/blocs/favorite_bloc.dart';
import 'package:gifsgram/data/gife_data.dart';

class FavoritesUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.getBloc<FavoriteBloc>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff8844dd),
        title: Text(
          "Favoritos",
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black45,
      body: StreamBuilder<Map<String, Gifs>>(
        initialData: {},
        stream: bloc.outFav,
        builder: (context, snapshot) {
          return ListView(
            children: snapshot.data.values.map((map) {
              return InkWell(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Image.network(map.imageSmall),
                ),
                onLongPress: () {
                  bloc.toogleFav(map);
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
