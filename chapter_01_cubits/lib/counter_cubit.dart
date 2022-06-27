import 'package:bloc/bloc.dart';

/// [Cubit] holds a state of an object of a given type
///
/// A state is just a collection of values at a moment in time
/// Here, the Cubit is type of [int], so the state will hold a value of type [int]
///
///
/// When a function is called, the [Cubit] emits a new state which can be,
///
/// 1. Accessed via state getter
/// 2. Listened to via a [Stream]
///
/// To follow a reactive approach, we will listen to the stream
class CounterCubit extends Cubit<int> {
  /// Every Cubit has to have an initial state
  CounterCubit(int initialState) : super(initialState);

  /// Emits a state incremented by 1
  void increment() => emit(state + 1);

  /// Emits a state decremented by 1
  void decrement() => emit(state - 1);
}
