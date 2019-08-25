import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:gifsgram/blocs/favorite_bloc.dart';
import 'package:gifsgram/data/gife_data.dart';

class GifsTile extends StatelessWidget {
  final Gifs gif;

  GifsTile(this.gif);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        color: Color(0xff111111),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16.0 / 9.0,
              child: Image.network(
                gif.imageSmall,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          gif.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                StreamBuilder<Map<String, Gifs>>(
                  stream: BlocProvider.getBloc<FavoriteBloc>().outFav,
                  initialData: {},
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return IconButton(
                        icon: Icon(
                          snapshot.data.containsKey(gif.id)
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.yellow,
                          size: 30,
                        ),
                        onPressed: () {
                          BlocProvider.getBloc<FavoriteBloc>().toogleFav(gif);
                        },
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
