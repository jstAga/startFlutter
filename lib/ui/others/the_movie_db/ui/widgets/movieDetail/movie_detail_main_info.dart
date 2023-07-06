import 'package:flutter/material.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/core/bases_ext.dart';

class MovieDetailMainInfo extends StatelessWidget {

  // const MovieDetailMainInfo({Key? key, required this.movieModel})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // _TopPosters(
      //   imageName: movieModel.imageName,
      // ),
      // Padding(
      //     padding: const EdgeInsets.all(20),
      //     child: _MovieName(year: " (2022)", title: movieModel.title)),
      const _Score(),
      const _MovieInfo(),
      const _Overview(),
      // _Description(movieModel: movieModel),
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


  // @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding: const EdgeInsets.all(8),
    //   child: Text(movieModel.description,
    //       style: BaseTextStyle.baseSimilarText(Colors.white)),
    // );
    return SizedBox.shrink();
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
              text: title, style: BaseTextStyle.baseTitleText(Colors.white)),
          TextSpan(
            text: year,
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
    return ColoredBox(
      color: const Color.fromRGBO(22, 21, 25, 1.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Text(
          "R 24/03/2023 (US) 2h 50m Action,Thriller,Crime",
          textAlign: TextAlign.center,
          maxLines: 3,
          style: BaseTextStyle.baseSimilarText(Colors.white),
        ),
      ),
    );
  }
}
