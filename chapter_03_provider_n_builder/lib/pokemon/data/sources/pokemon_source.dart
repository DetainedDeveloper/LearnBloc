import 'package:http/http.dart';

class PokemonSource {
  const PokemonSource();

  static final Client _http = Client();

  Future<String?> getPokemonById(int id) async {
    final Response response = await _http.get(
      Uri.parse('https://pokedex-pokemon-api.herokuapp.com/api/pokemon?id=$id'),
    );

    if (response.statusCode == 200) {
      return response.body;
    }
  }

  Future<String?> getRandomPokemon() async {
    final Response response = await _http.get(
      Uri.parse('https://pokedex-pokemon-api.herokuapp.com/api/pokemon/random'),
    );

    if (response.statusCode == 200) {
      return response.body;
    }
  }
}
