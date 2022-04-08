import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../bloc/movie/movie_detail_bloc.dart';
import '../../utils/my_scroll_behavior.dart';

class DetailScreen extends StatefulWidget {
  int movieId;

  DetailScreen({
    Key? key,
    required this.movieId
  });

  @override
  DetailScreenState createState() {
    return DetailScreenState();
  }
}

class DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    movieDetailBloc.fetchMovieDetail(widget.movieId);

    return Scaffold(
      body: Stack(
        children: [

          _buildBody(),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                title: Image.asset("assets/icon_netflix.png"),
                centerTitle: true,
                brightness: Brightness.light,
                iconTheme: IconThemeData(
                    color: Colors.black
                ),
                elevation: 0,
                backgroundColor: Colors.transparent,
                actions: [
                  IconButton(onPressed: () {

                  }, icon: Icon(
                    Icons.favorite_border,
                    color: Colors.black,
                  ))
                ],
              ))
        ],
      ),
    );
  }

  _buildBody() {
    return ScrollConfiguration(
        behavior: MyScrollBehavior()
        , child: SingleChildScrollView(
      child: StreamBuilder(
        stream: movieDetailBloc.movieDetail,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return buildContent(snapshot, context);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          return Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              child: Center(child: CircularProgressIndicator()));
        },

      ),
    ));
  }

Widget buildContent(AsyncSnapshot snapshot, BuildContext context) {
    return Container(
      child: Column(
        children: [
          _buildBackDrop(),
          Padding(padding: EdgeInsets.only(top: 20)),

          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildMovieName(),
                Padding(padding: EdgeInsets.only(top: 10)),
                _buildGenres(),
                Padding(padding: EdgeInsets.only(top: 10)),
                _buildRating(),
                Padding(padding: EdgeInsets.only(top: 10)),
                _buildMovieInfo(),
                Padding(padding: EdgeInsets.only(top: 10)),
                _buildMovieDescription(),
                Padding(padding: EdgeInsets.only(top: 20)),
                _buildScreenShot()

              ],
            ),
          )
        ],
      ),
    );
  }

  _buildBackDrop() {}

  _buildMovieName() {}

  _buildGenres(){}

  _buildRating(){}

  _buildMovieInfo(){}

  _buildMovieDescription() {}

  _buildScreenShot(){}
}
