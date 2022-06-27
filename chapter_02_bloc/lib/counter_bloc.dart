import 'package:bloc/bloc.dart';
import 'package:chapter_02_bloc/counter_event.dart';
import 'package:chapter_02_bloc/counter_state.dart';

/// [Bloc] takes a stream of events as input and produces a stream of states as output
///
/// When an event is added to [Bloc] it is expected to emit a corresponding state
///
///
/// Here, the [CounterBloc] is expecting an event of type [CounterEvent] and
/// is expected to emit a state of type [CounterState]
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  /// Every Bloc has to have an initial state
  ///
  /// [CounterBloc] will emit [CounterState] with incremented or decremented value
  /// depending upon the event
  CounterBloc(CounterState initialState) : super(initialState) {
    on<CounterEvent>(
      (event, emit) {
        if (event is IncrementEvent) {
          emit(CounterState(value: state.value + 1));
        } else if (event is DecrementEvent) {
          emit(CounterState(value: state.value - 1));
        }
      },
    );
  }
}
