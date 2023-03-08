import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    print(moviesProvider.onDisplayMovies);

    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Peliculas en cine')),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.search_outlined))
          ],
        ),
        //el SingleChildScrollView es para que la imagen no se salga de cuadro y se pueda hacer scroll!
        body: SingleChildScrollView(
            child: Column(
          children: [
            //*tarjetas principales!
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            //*Listado horizontal de peliculas!
            MoviesSlider(
              movies: moviesProvider.popularMovies,
              title: 'Populares',
            ),
          ],
        )));
  }
}
