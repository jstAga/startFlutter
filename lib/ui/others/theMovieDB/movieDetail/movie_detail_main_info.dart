import 'package:flutter/material.dart';
import 'package:start_flutter/ui/others/theMovieDB/movies/movies.dart';

class MovieDetailMainInfo extends StatelessWidget {
  final MovieModel movieModel;

  const MovieDetailMainInfo({Key? key, required this.movieModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _TopPosters(
        imageName: movieModel.imageName,
      ),
      Padding(
          padding: const EdgeInsets.all(20),
          child: _MovieName(year: " (2022)", title: movieModel.title)),
      const _Score(),
      const _MovieInfo(),
      const _Overview(),
      _Description(movieModel: movieModel),
      const _ActorsInfo()
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
            child: const Text("User Score",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white))),
        Container(width: 1, height: 15, color: Colors.white),
        TextButton(
            onPressed: () {},
            child: const Text("Play Trailer",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)))
      ],
    );
  }
}

class _ActorsInfo extends StatelessWidget {
  const _ActorsInfo();

  @override
  build(BuildContext context) {
    const nameStyle = TextStyle(
        fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white);
    const jobStyle = TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white);
    return const Column(
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Derek Kolstad", style: nameStyle),
                Text("Characters", style: jobStyle),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Chad Stahelski", style: nameStyle),
                Text("Director", style: jobStyle),
              ],
            )
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Derek Kolstad", style: nameStyle),
                Text("Characters", style: jobStyle),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Chad Stahelski", style: nameStyle),
                Text("Director", style: jobStyle),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({
    super.key,
    required this.movieModel,
  });

  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        movieModel.description,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Text(
        "Overview",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
      ),
    );
  }
}

class _TopPosters extends StatelessWidget {
  final String imageName;

  const _TopPosters({Key? key, required this.imageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
            height: 250,
            width: double.infinity,
            image: AssetImage(imageName),
            fit: BoxFit.fitWidth),
        Positioned(
            top: 16,
            left: 12,
            child: Image(image: AssetImage(imageName), width: 150, height: 200))
      ],
    );
  }
}

class _MovieName extends StatelessWidget {
  const _MovieName({Key? key, required this.year, required this.title})
      : super(key: key);

  final String year;
  final String title;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      maxLines: 3,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              )),
          TextSpan(
              text: year,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}

class _MovieInfo extends StatelessWidget {
  const _MovieInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Color.fromRGBO(22, 21, 25, 1.0),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 60),
        child: Text(
          "R 24/03/2023 (US) 2h 50m Action,Thriller,Crime",
          textAlign: TextAlign.center,
          maxLines: 3,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
        ),
      ),
    );
  }
}
