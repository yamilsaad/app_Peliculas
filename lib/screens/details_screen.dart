import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //!Instancia:
    //*TODO: Cambiar luego por una instancia movie!
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
        //!El CustomScrollView se usa casi especificamente para utilizar los slivers(que son comportamientos pre programados en el comportamiento del scroll)
        //!SI O SI LOS WIDGETS QUE SE USEN TIENEN QUE SER DE LA FAMILIA DE LOS SLIVERS!

        body: CustomScrollView(
      slivers: [
        _CustomAppBar(),
        _PosterAndTitle(),
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //*el SliverAppBar es como un AppBar per me permite conrolar otros atributos del mismo, como el ancho por ejemplo!
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200, //para ensanchar el SliverAppBar
      floating: false, //efecto de barra
      pinned: true, //para que no desaparesca nunca!
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: Text(
            'movie.title',
            style: TextStyle(fontSize: 16),
          ),
        ),
        //*el background va a ser lamagen de la pelicula que se va a visualizar en la barra!!!
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: AssetImage('assets/no-image.jpg'),
              height: 150,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Text(
                'movie.title',
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          )
        ],
      ),
    );
  }
}
