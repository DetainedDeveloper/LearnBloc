import 'package:chapter_03_provider_n_builder/pokemon/data/models/pokemon.dart';
import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        boxShadow: [
          BoxShadow(color: Theme.of(context).dividerColor, blurRadius: 8.0),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: Text(
                pokemon.name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            ListTile(
              title: Text('${pokemon.height} cm'),
              subtitle: const Text('Height'),
              leading: const Icon(Icons.height),
            ),
            ListTile(
              title: Text('${pokemon.weight} kg'),
              subtitle: const Text('Weight'),
              leading: const Icon(Icons.scale),
            ),
            ListTile(
              title: Text('${pokemon.xp}'),
              subtitle: const Text('XP'),
              leading: const Icon(Icons.bar_chart),
            ),
          ],
        ),
      ),
    );
  }
}
