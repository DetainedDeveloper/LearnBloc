import 'dart:convert';

import 'package:chapter_03_provider_n_builder/pokemon/data/models/pokemon.dart';
import 'package:chapter_03_provider_n_builder/pokemon/data/sources/pokemon_source.dart';

class PokemonRepository {
  const PokemonRepository();

  static const PokemonSource _source = PokemonSource();

  Future<Pokemon?> getPokemonById(int id) async {
    final String? data = await _source.getPokemonById(id);

    if (data != null) {
      return Pokemon.fromData(json.decode(data));
    }
  }

  Future<Pokemon?> getRandomPokemon() async {
    final String? data = await _source.getRandomPokemon();

    if (data != null) {
      return Pokemon.fromData(json.decode(data));
    }
  }
}
