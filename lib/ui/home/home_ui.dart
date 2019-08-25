import 'package:flutter/material.dart';
import 'package:gifsgram/ui/home/widgets/search_home.dart';

class HomeUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            actions: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text(
                  "0",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.star_half,
                  size: 30,
                  color: Colors.yellowAccent,
                ),
              ),
              IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch());
                },
                icon: Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.white,
                ),
              )
            ],
            backgroundColor: Color(0xff8844dd),
            title: Container(
              height: 30,
              child: Image.asset("assets/giphy.png"),
            ),
          ),
        ],
      ),
    );
  }
}

//  GridView.builder(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisSpacing: 4,
//         mainAxisSpacing: 4,
//         crossAxisCount: 2,
//       ),
//       itemCount: 5,
//       itemBuilder: (context, index) {
//         return Card();
//       },
//     );
