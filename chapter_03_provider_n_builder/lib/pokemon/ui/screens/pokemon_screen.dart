import 'package:chapter_03_provider_n_builder/pokemon/logic/bloc/pokemon_bloc.dart';
import 'package:chapter_03_provider_n_builder/pokemon/logic/bloc/pokemon_state.dart';
import 'package:chapter_03_provider_n_builder/pokemon/ui/widgets/pokemon_card.dart';
import 'package:chapter_03_provider_n_builder/pokemon/ui/widgets/pokemon_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch a Pokemon'),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<PokemonBloc, PokemonState>(
              builder: (context, state) {
                if (state is InitialState) {
                  return const Center(child: Text('Fetch a Pokemon!'));
                } else if (state is LoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is LoadedState) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: SingleChildScrollView(
                        child: PokemonCard(pokemon: state.pokemon),
                      ),
                    ),
                  );
                } else if (state is FailureState) {
                  return Text(state.message);
                } else {
                  return const Center(child: Text('Invalid state'));
                }
              },
            ),
          ),
          const PokemonControl(),
        ],
      ),
    );
  }
}
