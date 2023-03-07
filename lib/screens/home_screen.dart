import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            //*TODO: CardSwiper
            //*tarjetas principales!
            CardSwiper(),
            //*Listado horizontal de peliculas!
            MoviesSlider(),
          ],
        )));
  }
}
