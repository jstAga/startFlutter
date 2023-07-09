import 'package:flutter/material.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/widgets/movieDetail/movie_details_screen_cast.dart';

class MovieDetailsWidget extends StatefulWidget {
  const MovieDetailsWidget({super.key});

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    // final MovieModel movieModel = MovieDbConstants.moviesData[widget.id];
    return Scaffold(
      appBar: AppBar(
          // title: Text(movieModel.title, maxLines: 1),
          ),
      body: ColoredBox(
        color: const Color.fromRGBO(24, 22, 27, 1),
        child: ListView(
          children: [
            // MovieDetailMainInfo(movieModel: movieModel),
            const SizedBox(height: 20),
            const MovieDetailsScreenCast()
          ],
        ),
      ),
    );
  }
}
