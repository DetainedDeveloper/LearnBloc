import 'package:chapter_03_provider_n_builder/pokemon/logic/bloc/pokemon_bloc.dart';
import 'package:chapter_03_provider_n_builder/pokemon/logic/bloc/pokemon_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'horizontal_divider.dart';

class PokemonControl extends StatelessWidget {
  const PokemonControl({Key? key}) : super(key: key);

  static final TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final PokemonBloc pokemonBloc = BlocProvider.of<PokemonBloc>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
          boxShadow: [
            BoxShadow(color: Theme.of(context).dividerColor, blurRadius: 8.0),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: _idController,
                        decoration: const InputDecoration(hintText: 'Pokemon id'),
                        keyboardType: const TextInputType.numberWithOptions(),
                        minLines: 1,
                        maxLines: 1,
                        maxLength: 3,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        child: const Text('Get by id'),
                        onPressed: () {
                          pokemonBloc.add(
                            GetPokemonByIdEvent(
                              id: int.parse(_idController.text),
                            ),
                          );
                          _idController.clear();
                          FocusScope.of(context).unfocus();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: _OR(),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  child: const Text('Get random'),
                  onPressed: () => pokemonBloc.add(const GetRandomPokemonEvent()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OR extends StatelessWidget {
  const _OR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: HorizontalDivider(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('or'),
        ),
        Expanded(
          child: HorizontalDivider(),
        ),
      ],
    );
  }
}
