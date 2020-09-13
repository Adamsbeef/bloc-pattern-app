import 'dart:convert';

import 'package:http/http.dart';
import 'package:testing_out_bloc/src/models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _api_key = '9c8cece47a912bd5f77cf9731a28c434';

  Future<ItemModel> fecthMoviesList() async {
    print("entered");
    final response = await client
        .get("http://api.themoviedb.org/3/movie/popular?api_key=$_api_key");
    print(response.body.toString());
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
