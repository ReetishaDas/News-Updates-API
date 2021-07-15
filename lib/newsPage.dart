import 'package:flutter/material.dart';
import 'package:flutter_assignment/api_manager.dart';
import 'Fav Page.dart';
import 'news_info.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  Future<Welcome> _newsModel;

  @override
  void initState() {
    _newsModel = ApiManager().getNews();
    super.initState();
  }

  int _currentIndex = 0;

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
      body: Container(
        child: FutureBuilder<Welcome>(
          future: _newsModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (context, index) {
                    var article = snapshot.data.data[index];
                    var formattedTime = article.published;
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 5.0, top: 7, right: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35),
                              topRight: Radius.circular(35),
                              bottomLeft: Radius.circular(35),
                              bottomRight: Radius.circular(35)),
                        ),
                        width: double.infinity,
                        height: 150,
                        margin: const EdgeInsets.all(8),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 12),
                              child: Icon(
                                Icons.favorite_outline,
                                color: Colors.grey[700],
                                size: 35,
                              ),
                            ),
                            Flexible(
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        article.title,
                                        overflow: TextOverflow.values[2],
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    if (article.summary != null)
                                      Text(
                                        article.summary,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      formattedTime,
                                      style: TextStyle(color: Colors.grey[600]),
                                    ),
                                  ]),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            } else
              return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget buildNavigationItem(IconData icon, String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
          if (_currentIndex == 1) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FavPage()));
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
