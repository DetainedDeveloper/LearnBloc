/// An event is a representation of an action being performed (by anyone)
///
/// There can be multiple events throughout the lifecycle of an app
abstract class CounterEvent {
  const CounterEvent();
}

class IncrementEvent extends CounterEvent {
  const IncrementEvent();
}

class DecrementEvent extends CounterEvent {
  const DecrementEvent();
}
