import 'package:chapter_03_provider_n_builder/counter/data/counter_data.dart';
import 'package:chapter_03_provider_n_builder/counter/logic/counter_event.dart';
import 'package:chapter_03_provider_n_builder/counter/logic/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  static final CounterData _counterData = CounterData();

  CounterBloc(CounterState initialState) : super(initialState) {
    on<CounterEvent>(
      (event, emit) {
        emit(_handleEvent(event));
      },
    );
  }

  /// Parses the value received from [CounterEvent] and updates counter value
  ///
  /// If parsed value is not null, it returns [ValidCounterState] and
  /// [InvalidCounterState] if it is null
  CounterState _handleEvent(CounterEvent event) {
    final int? parsedValue = int.tryParse(event.value);

    if (parsedValue != null) {
      if (event is IncrementEvent) {
        final int result = _counterData.counterValue + parsedValue;
        _counterData.setCounterValue(result);

        return ValidCounterState(value: result);
      } else if (event is DecrementEvent) {
        final int result = _counterData.counterValue - parsedValue;
        _counterData.setCounterValue(result);

        return ValidCounterState(value: result);
      } else {
        return const InvalidCounterState(message: 'Invalid event');
      }
    } else {
      return const InvalidCounterState(message: 'Invalid input');
    }
  }
}
