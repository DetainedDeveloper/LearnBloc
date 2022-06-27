import 'dart:async';

import 'package:chapter_01_cubits/counter_cubit.dart';

/// The [CounterCubit] will emit a new state whenever a function is called
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
  final CounterCubit counterCubit = CounterCubit(0);

  print('Initial Counter Value : ${counterCubit.state}');

  counterCubit.stream.listen(
        (value) {
      print('Counter Value : $value');
    },
  );

  Future.delayed(const Duration(seconds: 1), () => counterCubit.increment());

  Future.delayed(const Duration(seconds: 2), () => counterCubit.decrement());

  Future.delayed(const Duration(seconds: 3), () => counterCubit.close());
}
