import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/data/model/genre_model.dart';
import 'package:movie_app/data/model/production_company_model.dart';
import 'package:movie_app/data/model/production_country_model.dart';
import 'package:movie_app/widget/detail/movie_gallery.dart';

import '../../bloc/movie/movie_detail_bloc.dart';
import '../../data/model/movie_detail_model.dart';
import '../../utils/my_scroll_behavior.dart';

class DetailScreen extends StatefulWidget {
  int movieId;

  DetailScreen({Key? key, required this.movieId});

  @override
  DetailScreenState createState() {
    return DetailScreenState();
  }
}

class DetailScreenState extends State<DetailScreen> {
  bool isExpanded = false;

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
                iconTheme: IconThemeData(color: Colors.black),
                elevation: 0,
                backgroundColor: Colors.transparent,
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
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
        behavior: MyScrollBehavior(),
        child: SingleChildScrollView(
          child: StreamBuilder(
            stream: movieDetailBloc.movieDetail,
            builder: (BuildContext context,
                AsyncSnapshot<MovieDetailModel> snapshot) {
              if (snapshot.hasData) {
                return buildContent(snapshot, context);
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }

              return Container(
                  height: MediaQuery.of(context).size.height,
                  child: Center(child: CircularProgressIndicator()));
            },
          ),
        ));
  }

  Widget buildContent(
      AsyncSnapshot<MovieDetailModel> snapshot, BuildContext context) {
    return Container(
      child: Column(
        children: [
          _buildBackDrop(context, snapshot.data!.backdrop_path!),
          Padding(padding: EdgeInsets.only(top: 20)),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildMovieName(context, snapshot.data!.title),
                Padding(padding: EdgeInsets.only(top: 10)),
                _buildGenres(context, snapshot.data!.genres),
                Padding(padding: EdgeInsets.only(top: 10)),
                _buildRating(context, snapshot.data!.vote_average,
                    snapshot.data!.vote_count),
                Padding(padding: EdgeInsets.only(top: 10)),
                _buildMovieInfo(
                    context,
                    snapshot.data!.release_date,
                    snapshot.data!.production_companies,
                    snapshot.data!.runtime),
                Padding(padding: EdgeInsets.only(top: 20)),
                _buildMovieDescription(context, snapshot.data!.overview),
                Padding(padding: EdgeInsets.only(top: 20)),
                _buildScreenShot(context, widget.movieId)
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildBackDrop(BuildContext context, String backdrop) {
    return Container(
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        var width = constraints.biggest.width;
        return Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipPath(
                    clipper: Mclipper(),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0.0, 10.0),
                                blurRadius: 10.0)
                          ]),
                      child: Container(
                        width: width,
                        height: width,
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w780$backdrop',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.add,
                          ),
                          onPressed: () {
                            debugPrint("Hello");
                          },
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.share,
                          ),
                          onPressed: () {
                            debugPrint("Hello");
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              right: width / 2 - 25,
              top: width,
              child: FractionalTranslation(
                translation: Offset(0.0, -0.5),
                child: FloatingActionButton(
                  onPressed: () {
                    print('Touch');
                  },
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }

  _buildMovieName(BuildContext context, String name) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        name,
        style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "Muli"),
      ),
    );
  }

  _buildGenres(BuildContext context, List<GenreModel> genres) {
    StringBuffer genresValue = StringBuffer();

    for (var i = 0; i < genres.length; i++) {
      if (genres[i] != null) {
        if (i != 0) {
          genresValue.write(", ");
        }

        genresValue.write(genres[i].name);
      }
    }

    return Container(
        alignment: Alignment.center,
        child: Text(
          genresValue.toString(),
          style: TextStyle(
              color: Colors.black45,
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
              fontFamily: "Muli"),
        ));
  }

  _buildRating(BuildContext context, double voteAverage, int voteCount) {
    return Container(
        child: RatingBar.builder(
      initialRating: (voteAverage / 10) * 5,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    ));
  }

  _buildMovieInfo(BuildContext context, String release_date,
      List<ProductionCompanyModel> list, int runtime) {
    StringBuffer productionCountries = StringBuffer();
    for (var i = 0; i < list.length; i++) {
      if (list[0] != null) {
        if (i != 0) {
          productionCountries.write(", ");
        }

        productionCountries.write(list[i].id);
      }
    }

    return Container(
      child: Row(
        children: [
          Expanded(
            child: Container(),
          ),
          _buildMovieMoreInfoItem("Year", release_date.substring(0, 4) ?? ""),
          _buildMovieMoreInfoItem(
              "Country", productionCountries.toString() ?? ""),
          _buildMovieMoreInfoItem("Length", "$runtime min"),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }

  _buildMovieDescription(BuildContext context, String description) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: GestureDetector(
        onTap: _expand,
        child: Container(
          alignment: Alignment.center,
          child: AnimatedCrossFade(
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            secondChild: Text(
              description,
              style: TextStyle(color: Colors.black87, fontSize: 14),
            ),
            duration: Duration(seconds: 1),
            firstChild: Text(
              description,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black87, fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }

  _buildScreenShot(BuildContext context, int movieId) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text("Screenshots", style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Muli"),
                ),
              ),
              Icon(Icons.arrow_forward, color: Colors.black,)
            ],
          ),
          MovieGallery(movieId: movieId,)
        ],
      ),
    );
  }

  _buildMovieMoreInfoItem(String title, String value) {
    // return LayoutBuilder(builder: (context, constraints) {
    //   return Container(
    //     width: constraints.biggest.width > 100 ? 100 : constraints.biggest.width,
    //     padding: EdgeInsets.only(left: 10, right: 10),
    //     child: Column(
    //       children: [
    //         Text(
    //           title, style: TextStyle(
    //             color: Colors.black45,
    //             fontSize: 12.0,
    //             fontWeight: FontWeight.bold,
    //             fontFamily: "Muli"),
    //         )
    //       ],
    //     ),
    //   );
    //
    // },);

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        width: constraints.biggest.width > 100 ? 100 : double.infinity,
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                  color: Colors.black45,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Muli"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
            ),
            Wrap(
              children: <Widget>[
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Muli"),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  void _expand() {
    setState(() {
      isExpanded ? isExpanded = false : isExpanded = true;
    });
  }
}

class Mclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 40.0);

    var controlPoint = Offset(size.width / 4, size.height);
    var endpoint = Offset(size.width / 2, size.height);

    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endpoint.dx, endpoint.dy);

    var controlPoint2 = Offset(size.width * 3 / 4, size.height);
    var endpoint2 = Offset(size.width, size.height - 40.0);

    path.quadraticBezierTo(
        controlPoint2.dx, controlPoint2.dy, endpoint2.dx, endpoint2.dy);

    path.lineTo(size.width, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
