import 'package:chapter_02_bloc/counter_bloc.dart';
import 'package:chapter_02_bloc/counter_event.dart';
import 'package:chapter_02_bloc/counter_state.dart';

/// The [CounterBloc] will emit [CounterState] with different values when an [CounterEvent] is added
///
/// These changes can be listened via [Stream]
///
///
/// The output of following code should look like this,
///
/// Initial Counter Value : 0
/// Counter Value : 1
/// Counter Value : 2
void main() {
  final CounterBloc counterBloc = CounterBloc(const CounterState(value: 0));

  print('Initial Counter Value : ${counterBloc.state.value}');

  counterBloc.stream.listen(
    (state) {
      print('Counter Value : ${state.value}');
    },
  );

  Future.delayed(
    const Duration(seconds: 1),
    () => counterBloc.add(const IncrementEvent()),
  );

  Future.delayed(
    const Duration(seconds: 2),
    () => counterBloc.add(const DecrementEvent()),
  );

  Future.delayed(
    const Duration(seconds: 3),
    () => counterBloc.close(),
  );
}
