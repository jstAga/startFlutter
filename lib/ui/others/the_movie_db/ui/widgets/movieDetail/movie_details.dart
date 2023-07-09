import 'package:flutter/material.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/core/bases/base_providers.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/widgets/movieDetail/movie_details_main_info.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/widgets/movieDetail/movie_details_model.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/widgets/movieDetail/movie_details_screen_cast.dart';

class MovieDetailsWidget extends StatefulWidget {
  const MovieDetailsWidget({super.key});

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    NotifierProvider.read<MovieDetailsModel>(context)
        ?.setupLocalization(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const _Title(),
      ),
      body: const ColoredBox(
        color: Color.fromRGBO(24, 22, 27, 1),
        child: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final movieDetails =
        NotifierProvider.watch<MovieDetailsModel>(context)?.movieDetails;
    if (movieDetails == null){
      return const Center(child: CircularProgressIndicator());
    } else {
    return ListView(
      children: const [
        MovieDetailsMainInfo(),
        SizedBox(height: 20),
        MovieDetailsScreenCast()
      ],
    );
  }}
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    final model =
        NotifierProvider.watch<MovieDetailsModel>(context)?.movieDetails;
    return Text(model?.title ?? "Loading", maxLines: 1);
  }
}
