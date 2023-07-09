import 'package:flutter/material.dart';
import 'package:start_flutter/resources/resources.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/core/bases_ext.dart';

class MovieDetailsScreenCast extends StatelessWidget {
  const MovieDetailsScreenCast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextButton(
              onPressed: () {},
              child: Text("Series Cast",
                  style: BaseTextStyle.baseTitleText(Colors.black)),
            ),
          ),
          SizedBox(
            height: 200,
            child: Scrollbar(
              child: ListView.builder(
                  itemCount: 20,
                  itemExtent: 120,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.black.withOpacity(0.2),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2))
                            ],
                          ),
                          child: ClipRRect(
                            clipBehavior: Clip.hardEdge,
                            borderRadius: BorderRadius.circular(12),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image(
                                    image: (AssetImage(Images.mvdbKeanuReevs))),
                                Text("Keanu Reevs",
                                    maxLines: 2,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black)),
                                Text("John Wick",
                                    maxLines: 2,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: Colors.black))
                              ],
                            ),
                          ),
                        ));
                  }),
            ),
          ),
          TextButton(
              onPressed: () {},
              child: Text("Full Cast & Crew",
                  style: BaseTextStyle.baseTitleText(Colors.black)))
        ],
      ),
    );
  }
}
