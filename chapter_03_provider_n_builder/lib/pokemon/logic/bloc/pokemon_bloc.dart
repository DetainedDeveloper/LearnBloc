import 'package:chapter_03_provider_n_builder/pokemon/data/models/pokemon.dart';
import 'package:chapter_03_provider_n_builder/pokemon/data/repositories/pokemon_repository.dart';
import 'package:chapter_03_provider_n_builder/pokemon/logic/bloc/pokemon_event.dart';
import 'package:chapter_03_provider_n_builder/pokemon/logic/bloc/pokemon_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  static const PokemonRepository _repository = PokemonRepository();

  PokemonBloc(PokemonState initialState) : super(initialState) {
    on<PokemonEvent>(
      (event, emit) async {
        if (event is GetPokemonByIdEvent) {
          emit(const LoadingState());

          if (event.id > 0 && event.id <= 890) {
            Pokemon? pokemon = await _repository.getPokemonById(event.id);
            emit(_handlePokemon(pokemon));
          } else {
            emit(const FailureState(message: 'Valid id range is 1 to 890'));
          }
        } else if (event is GetRandomPokemonEvent) {
          emit(const LoadingState());

          Pokemon? pokemon = await _repository.getRandomPokemon();
          emit(_handlePokemon(pokemon));
        }
      },
    );
  }

  PokemonState _handlePokemon(Pokemon? pokemon) {
    if (pokemon != null) {
      return LoadedState(pokemon: pokemon);
    } else {
      return const FailureState(message: 'Failed to fetch a pokemon');
    }
  }
}
