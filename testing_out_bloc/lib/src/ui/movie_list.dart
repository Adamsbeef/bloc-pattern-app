import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing_out_bloc/src/blocs/movies_bloc.dart';
import 'package:testing_out_bloc/src/models/item_model.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = MoviesBloc();
    bloc.fetchAllMovies();
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Listing App."),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.results.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].poster_path}',
            fit: BoxFit.cover,
          );
        });
  }
}
