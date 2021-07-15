import 'package:flutter/material.dart';
import 'package:flutter_assignment/newsPage.dart';

class FavPage extends StatefulWidget {
  @override
  _FavPageState createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildNavigationItem(Icons.list_sharp, "News", 0),
          buildNavigationItem(Icons.favorite, "Favourite", 1),
        ],
      ),
    );
  }

  Widget buildNavigationItem(IconData icon, String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
          if (_currentIndex == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NewsPage()));
          }
        });
      },
      child: Container(
        child: Column(
          children: [
            Icon(
              icon,
              size: 40,
              color: index == _currentIndex ? Colors.black : Colors.red[700],
            ),
            Text(
              text,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        height: 70,
        width: MediaQuery.of(context).size.width / 2.2,
        decoration: index == _currentIndex
            ? BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 7,
                    blurRadius: 2,
                    offset: Offset(0, 5), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(15), topEnd: Radius.circular(15)),
                gradient: LinearGradient(
                  colors: [
                    Colors.blue[900].withOpacity(0.9),
                    Colors.blue[900].withOpacity(0.9),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              )
            : BoxDecoration(),
      ),
    );
  }
}
