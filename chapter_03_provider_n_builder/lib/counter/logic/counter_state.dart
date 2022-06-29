abstract class CounterState {
  const CounterState();
}

class ValidCounterState extends CounterState {
  final int value;

  const ValidCounterState({required this.value});
}

class InvalidCounterState extends CounterState {
  final String message;

  const InvalidCounterState({required this.message});
}
