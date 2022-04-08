import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/bloc/movie/movie_list_bloc.dart';
import 'package:movie_app/utils/size_config.dart';

import '../../data/model/item_model.dart';

class MovieListView extends StatefulWidget {

  String type;
  dynamic onClickItem;

  MovieListView({
    required this.type,
    required this.onClickItem});

  @override
  MovieListViewState createState() {
    return MovieListViewState();
  }
}

class MovieListViewState extends State<MovieListView> {

  @override
  Widget build(BuildContext context) {

    var width = SizeConfig(context);
    movieListBloc.fetchMovieList(widget.type);

    return StreamBuilder(
      stream: movieListBloc.movieList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildContent(snapshot as AsyncSnapshot<ItemModel>, context);
        }
        else if(snapshot.hasError){
          return Text(snapshot.error.toString());
        }
        return Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      });
  }

  Widget buildContent(AsyncSnapshot<ItemModel> snapshot, BuildContext context) {
    var width = new SizeConfig(context).width;

    return Container(
      height: width / 1.75,
      child: ListView.builder(
        itemCount: snapshot.data!.results.length > 10 ? 10 : snapshot.data?.results.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var item = snapshot.data!.results[index];

          return InkWell(
            /// onTap: widget.onClickItem(index),
            child: _buildItem(
                item.poster_path,
                item.backdrop_path,
                width / 4,
                index == 0),
          );
        },),
    );
  }

  _buildItem(String imagePath, String backdropPath, double itemHeight,
      bool isFirst) {
    return Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10,
        margin: EdgeInsets.only(left: isFirst ? 20 : 10, right: 10, bottom: 20),
        shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Image.network('https://image.tmdb.org/t/p/w500$imagePath',
          fit: BoxFit.cover,
          width: itemHeight * 4 / 3,
          height: itemHeight / 2,
        )
    );
  }
}
