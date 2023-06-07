import 'package:flutter/material.dart';
import 'package:start_flutter/ui/others/theMovieDB/core/constants.dart';
import 'package:start_flutter/ui/others/theMovieDB/movieDetail/movie_detail_main_info.dart';
import 'package:start_flutter/ui/others/theMovieDB/movieDetail/movie_detail_screen_cast.dart';
import 'package:start_flutter/ui/others/theMovieDB/movies/movies.dart';

class MovieDetail extends StatefulWidget {
  final int id;

  const MovieDetail({Key? key, required this.id}) : super(key: key);

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    final MovieModel movieModel = Constants.moviesData[widget.id];
    return Scaffold(
      appBar: AppBar(
        title: Text(movieModel.title, maxLines: 1),
      ),
      body: ColoredBox(
        color: const Color.fromRGBO(24, 22, 27, 1),
        child: ListView(
          children: [
            MovieDetailMainInfo(movieModel: movieModel),
            const SizedBox(height: 20),
            const MovieDetailScreenCast()
          ],
        ),
      ),
    );
  }
}
