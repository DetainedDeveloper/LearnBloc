import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter/logic/counter_bloc.dart';
import 'counter/logic/counter_state.dart';
import 'counter/ui/counter_screen.dart';
import 'pokemon/logic/bloc/pokemon_bloc.dart';
import 'pokemon/logic/bloc/pokemon_state.dart';
import 'pokemon/ui/screens/pokemon_screen.dart';

void main() {
  runApp(const LearnBlocApp());
}

class LearnBlocApp extends StatelessWidget {
  const LearnBlocApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LearnBloc - Chapter 03',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const _HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlocProvider and BlocBuilder'),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Counter'),
            subtitle: const Text('Classic counter example with a twist'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => CounterBloc(const ValidCounterState(value: 0)),
                    child: const CounterScreen(),
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Fetch a Pokemon'),
            subtitle: const Text('Fetch data of a random Pokemon and display it'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => PokemonBloc(const InitialState()),
                    child: const PokemonScreen(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
