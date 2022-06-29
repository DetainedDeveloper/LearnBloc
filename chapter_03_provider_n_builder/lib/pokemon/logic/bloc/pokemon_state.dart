import 'package:chapter_03_provider_n_builder/pokemon/data/models/pokemon.dart';

abstract class PokemonState {
  const PokemonState();
}

class InitialState extends PokemonState {
  const InitialState();
}

class LoadingState extends PokemonState {
  const LoadingState();
}

class LoadedState extends PokemonState {
  final Pokemon pokemon;

  const LoadedState({required this.pokemon});
}

class FailureState extends PokemonState {
  final String message;

  const FailureState({required this.message});
}
