import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../bloc/movie/movie_detail_bloc.dart';

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
      body: Container(
        child: Text('${widget.movieId}'),
      ),
    );
  }

}
