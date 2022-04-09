import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:movie_app/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../constants/global.dart';
import '../../widget/home/movie_list_view.dart';
import '../detail/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> with KeepAliveParentDataMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: ScrollConfiguration(
          behavior: ScrollBehavior(),
          child: SingleChildScrollView(
            child: Column(
              // SlideShowView(
              //
              // )
              children: [
                Padding(padding: EdgeInsets.only(top: 10)),
                _buildList(context),
                Padding(padding: EdgeInsets.only(top: 10)),
                _buildPopularList()
              ],
            ),
          ),
        )),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  _buildList(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    AppLocalizations.of(context)!.myList!,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Muli"),
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                )
              ],
            ),
          ),
          MovieListView(
            type: MovieListType.topRated,
            onClickItem: (movieId) {
              _navigateToMovieDetail(context, movieId);
            },
          )
        ],
      ),
    );
  }

  _buildPopularList() {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            alignment: Alignment.topLeft,
            child: Text(
              AppLocalizations.of(context)!.popular ?? "Popular List",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Muli"),
            ),
          ),
          MovieListView(
              type: MovieListType.popular,
              onClickItem: (movieId) {
                _navigateToMovieDetail(context, movieId);
              })
        ],
      ),
    );
  }

  _navigateToMovieDetail(BuildContext context, int movieId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(movieId: movieId),
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Person")
        ]);
  }

  @override
  void detach() {}

  @override
  // TODO: implement keptAlive
  bool get keptAlive => true;
}
