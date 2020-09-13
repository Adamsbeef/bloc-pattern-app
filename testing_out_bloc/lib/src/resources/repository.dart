import 'package:testing_out_bloc/src/models/item_model.dart';
import 'package:testing_out_bloc/src/resources/movie_api_provider.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<ItemModel> fetchAllMovies() async {
    moviesApiProvider.fecthMoviesList();
  }
}
