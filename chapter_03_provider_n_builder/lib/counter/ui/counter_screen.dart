import 'package:chapter_03_provider_n_builder/counter/logic/counter_bloc.dart';
import 'package:chapter_03_provider_n_builder/counter/logic/counter_event.dart';
import 'package:chapter_03_provider_n_builder/counter/logic/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  static final TextEditingController _decrementValueController = TextEditingController();
  static final TextEditingController _incrementValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
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
                    controller: _decrementValueController,
                    decoration: const InputDecoration(hintText: 'Decremental value'),
                    keyboardType: const TextInputType.numberWithOptions(),
                    minLines: 1,
                    maxLines: 1,
                    maxLength: 2,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _incrementValueController,
                    decoration: const InputDecoration(hintText: 'Incremental value'),
                    keyboardType: const TextInputType.numberWithOptions(),
                    minLines: 1,
                    maxLines: 1,
                    maxLength: 2,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: 'Decrement',
                  child: const Icon(Icons.remove),
                  onPressed: () => BlocProvider.of<CounterBloc>(context).add(
                    DecrementEvent(value: _decrementValueController.text),
                  ),
                ),
                BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    if (state is ValidCounterState) {
                      return Text(
                        '${state.value}',
                        style: Theme.of(context).textTheme.headline3,
                      );
                    } else if (state is InvalidCounterState) {
                      return Text(
                        state.message,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: Theme.of(context).errorColor,
                            ),
                      );
                    } else {
                      return Text(
                        'Invalid State',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: Theme.of(context).errorColor,
                            ),
                      );
                    }
                  },
                ),
                FloatingActionButton(
                  heroTag: 'Increment',
                  child: const Icon(Icons.add),
                  onPressed: () => BlocProvider.of<CounterBloc>(context).add(
                    IncrementEvent(value: _incrementValueController.text),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
