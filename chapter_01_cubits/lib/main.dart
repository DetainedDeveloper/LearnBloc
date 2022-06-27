import 'dart:async';

import 'package:chapter_01_cubits/counter_cubit.dart';

/// Listen to the stream of states emitted by [CounterCubit]
///
/// The [CounterCubit] will emit a new state whenever a method is called
///
///
/// The output of following code should look like this,
///
/// Initial Counter Value : 0
/// Counter Value : 1
/// Counter Value : 2
void main() {
  final CounterCubit counterCubit = CounterCubit(0);

  print('Initial Counter Value : ${counterCubit.state}');

  counterCubit.stream.listen(
        (value) {
      print('Counter Value : $value');
    },
  );

  Future.delayed(const Duration(seconds: 1), () => counterCubit.increment());

  Future.delayed(const Duration(seconds: 2), () => counterCubit.decrement());

  counterCubit.close();
}
