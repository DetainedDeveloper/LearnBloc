abstract class CounterEvent {
  final String value;

  const CounterEvent({required this.value});
}

class IncrementEvent extends CounterEvent {
  final String value;

  const IncrementEvent({required this.value}) : super(value: value);
}

class DecrementEvent extends CounterEvent {
  final String value;

  const DecrementEvent({required this.value}) : super(value: value);
}
