import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test03/providers/movies_provider.dart';
import 'package:test03/search/search_delegate.dart';
import 'package:test03/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    print(moviesProvider.onDisplayMovies);
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Peliculas en Cines')),
          actions: [
            IconButton(
                icon: const Icon(Icons.search_outlined),
                onPressed: () => showSearch(
                    context: context, delegate: MovieSearchDelegate()))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            //TODO: CardSwiper
            //tarjetas principales
            CardSwiper(
              movies: moviesProvider.onDisplayMovies,
            ),
            //Listado horizontal de peliculas
            MovieSlider(
              movies: moviesProvider.popularMovies,
              title: 'Populares',
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),
            const SizedBox(
              height: 50,
            )
          ]),
        ));
  }
}
