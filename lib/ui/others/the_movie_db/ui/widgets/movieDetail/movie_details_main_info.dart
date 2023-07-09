import 'package:flutter/material.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/core/bases/base_providers.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/core/bases_ext.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/widgets/movieDetail/movie_details_model.dart';

class MovieDetailsMainInfo extends StatelessWidget {
  const MovieDetailsMainInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _TopPoster(),
      Padding(
          padding: const EdgeInsets.all(20),
          child: _MovieName()),
      const _Score(),
      _MovieInfo(),
      const _Overview(),
      const _Description(),
      _ActorsInfo()
    ]);
  }
}

class _Score extends StatelessWidget {
  const _Score({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
            onPressed: () {},
            child: Text("User Score",
                style: BaseTextStyle.baseSimilarBoldText(Colors.white))),
        Container(width: 1, height: 15, color: Colors.white),
        TextButton(
            onPressed: () {},
            child: Text("Play Trailer",
                style: BaseTextStyle.baseSimilarBoldText(Colors.white)))
      ],
    );
  }
}

class _ActorsInfo extends StatelessWidget {
  const _ActorsInfo();

  @override
  build(BuildContext context) {
    const jobStyle = TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white);
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Derek Kolstad",
                    style: BaseTextStyle.baseSimilarText(Colors.white)),
                const Text("Characters", style: jobStyle),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Chad Stahelski",
                    style: BaseTextStyle.baseSimilarText(Colors.white)),
                const Text("Director", style: jobStyle),
              ],
            )
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Derek Kolstad",
                    style: BaseTextStyle.baseSimilarText(Colors.white)),
                const Text("Characters", style: jobStyle),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Chad Stahelski",
                    style: BaseTextStyle.baseSimilarText(Colors.white)),
                const Text("Director", style: jobStyle),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class _Description extends StatelessWidget {
  const _Description();

  @override
  Widget build(BuildContext context) {
    final model =
        NotifierProvider.watch<MovieDetailsModel>(context)?.movieDetails;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(model?.overview ?? "",
          style: BaseTextStyle.baseSimilarText(Colors.white)),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          "Overview",
          style: BaseTextStyle.baseTitleText(Colors.white),
        ));
  }
}

class _TopPoster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageUrl =
        NotifierProvider.watch<MovieDetailsModel>(context)?.movieDetails?.image;

    return Stack(
      children: [
        Image.network(
            imageUrl ??
                "https://w0.peakpx.com/wallpaper/200/532/HD-wallpaper-black-plain-thumbnail.jpg",
            width: double.infinity,
            fit: BoxFit.fitWidth),
      ],
    );
  }
}

class _MovieName extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final model =
        NotifierProvider.watch<MovieDetailsModel>(context)?.movieDetails;
    return RichText(
      textAlign: TextAlign.center,
      maxLines: 3,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: model?.title, style: BaseTextStyle.baseTitleText(Colors.white)),
          TextSpan(
            text: "(${model?.releaseDate?.year.toString()})",
            style: BaseTextStyle.baseTitleText(Colors.white),
          )
        ],
      ),
    );
  }
}

class _MovieInfo extends StatelessWidget {
  const _MovieInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model =
        NotifierProvider.watch<MovieDetailsModel>(context)?.movieDetails;
    return ColoredBox(
      color: const Color.fromRGBO(22, 21, 25, 1.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Text(
          "(${model?.allCountries}) ${model?.allGenres}",
          textAlign: TextAlign.center,
          maxLines: 3,
          style: BaseTextStyle.baseSimilarText(Colors.white),
        ),
      ),
    );
  }
}
