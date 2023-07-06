import 'package:flutter/material.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/core/bases/base_providers.dart';
import 'package:start_flutter/ui/others/the_movie_db/ui/widgets/movies/movies_model.dart';

class Movies extends StatelessWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = BaseNotifierProvider.watch<MoviesModel>(context);
    if (model == null) return const SizedBox.shrink();
    return Stack(
      children: [
        ListView.builder(
            padding: const EdgeInsets.only(top: 70),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: model.movies.length ?? 0,
            itemExtent: 163,
            itemBuilder: (BuildContext context, int index) {
              final movie = model.movies[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Stack(
                  children: [
                    Container(
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
                          ]),
                      clipBehavior: Clip.hardEdge,
                      child: Row(
                        children: [
                          // Image(image: AssetImage(movie.imageName)),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movie.title ?? "No title",
                                    maxLines: 1,
                                    // style: const TextStyle(
                                    //     fontWeight: FontWeight.bold,
                                    //     color: Colors.black)
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    movie.releaseDate.toString(),
                                    maxLines: 1,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    movie.overview ?? "No description",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () => model.toDetail(context, index),
                      ),
                    )
                  ],
                ),
              );
            }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: TextField(
            // controller: _searchController,
            decoration: InputDecoration(
                labelText: "Search",
                isDense: true,
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.blueAccent,
                ),
                fillColor: Colors.white.withOpacity(0.8),
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12))),
          ),
        )
      ],
    );
  }
}
