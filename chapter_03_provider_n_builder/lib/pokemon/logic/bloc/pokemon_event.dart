abstract class PokemonEvent {
  const PokemonEvent();
}

class GetPokemonByIdEvent extends PokemonEvent {
  final int id;

  const GetPokemonByIdEvent({required this.id});
}

class GetRandomPokemonEvent extends PokemonEvent {
  const GetRandomPokemonEvent();
}
