import 'package:flutter/material.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/core/movie_db_constants.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/widgets/movieDetail/movie_detail_main_info.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/widgets/movieDetail/movie_detail_screen_cast.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/widgets/movies/movies.dart';

class MovieDetailWidget extends StatefulWidget {
  final int id;

  const MovieDetailWidget({Key? key, required this.id}) : super(key: key);

  @override
  State<MovieDetailWidget> createState() => _MovieDetailWidgetState();
}

class _MovieDetailWidgetState extends State<MovieDetailWidget> {
  @override
  Widget build(BuildContext context) {
    final MovieModel movieModel = MovieDbConstants.moviesData[widget.id];
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