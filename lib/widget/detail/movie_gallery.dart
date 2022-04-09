import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/bloc/movie/movie_image_bloc.dart';
import 'package:movie_app/data/model/movie_image_model.dart';

class MovieGallery extends StatefulWidget {
  final int movieId;

  MovieGallery({Key? key,  required this.movieId}) : super(key: key);

  @override
  MovieGalleryState createState() {
    return MovieGalleryState();
  }
}

class MovieGalleryState extends State<MovieGallery> {
  @override
  Widget build(BuildContext context) {
    // movieImageBloc.fetchMovieImages(widget.movieId);

    // return StreamBuilder(
    //   stream: movieImageBloc.movieImages,
    //   builder: (context, AsyncSnapshot<MovieImageModel> snapshot) {
    //     if (snapshot.hasData) {
    //       buildContent(context, snapshot);
    //     } else if (snapshot.hasError) {
    //       return Text(snapshot.error.toString());
    //     }
    //     return Center(child: CircularProgressIndicator());
    //   },
    // );

    movieImageBloc.fetchMovieImages(widget.movieId);
    return StreamBuilder(
      stream: movieImageBloc.movieImages,
      builder: (context, AsyncSnapshot<MovieImageModel> snapshot) {
        if (snapshot.hasData) {
          return buildContent(context, snapshot);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  // Widget buildContent(BuildContext context, AsyncSnapshot<MovieImageModel>? snapshot) {
  //   var width = MediaQuery.of(context).size.width;
  //
  //   return Container(
  //     height: width / 3,
  //     margin: EdgeInsets.only(bottom: 50, top: 10),
  //     child: ListView.builder(
  //       scrollDirection: Axis.horizontal,
  //       itemCount: snapshot!.data!.posters.length > 10 ? 10 : snapshot!.data!.posters.length,
  //       itemBuilder: (context, index) {
  //         return _buildItem(
  //             snapshot!.data!.posters[index].file_path, width / 3, index == 0);
  //       },
  //     ),
  //   );
  // }
  //
  // Widget _buildItem(String imagePath, double itemHeight, bool isFirst) {
  //   return Card(
  //     clipBehavior: Clip.antiAliasWithSaveLayer,
  //     elevation: 10,
  //     margin: EdgeInsets.only(left: isFirst ? 0 : 10, right: 10, bottom: 20),
  //     shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.all(Radius.circular(10.0))),
  //     child: Image.network(
  //       'https://image.tmdb.org/t/p/w500$imagePath',
  //       fit: BoxFit.cover,
  //       width: itemHeight * 4 / 3,
  //       height: itemHeight / 2,
  //     ),
  //   );
  // }


  Widget buildContent( BuildContext context, AsyncSnapshot<MovieImageModel> snapshot) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Container(
      height: width / 3,
      margin: EdgeInsets.only(bottom: 50, top: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data!.posters.length > 10 ? 10 : snapshot.data!.posters.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildItem(snapshot.data!.posters[index].file_path, width / 3, index == 0);
        },
      ),
    );
  }

  _buildItem(String imagePath, double itemHeight, bool isFirst) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 10.0,
      margin: EdgeInsets.only(left: isFirst ? 0 : 10, right: 10, bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Image.network('https://image.tmdb.org/t/p/w500$imagePath',
        fit: BoxFit.cover,
        width: itemHeight * 4 / 3,
        height: itemHeight / 2,),
    );
  }
}
