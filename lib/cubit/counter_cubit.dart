import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(initialVal: 0));

  void increment() =>
      emit(CounterState(initialVal: state.initialVal + 1, incremented: true));

  void decrement() => emit(state.initialVal > 0
      ? CounterState(initialVal: state.initialVal - 1, incremented: false)
      : CounterState(initialVal: 0));
}
